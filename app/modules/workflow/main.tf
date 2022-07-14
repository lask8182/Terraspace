# ################################################################################
# #  RDS
# ################################################################################
resource "aws_db_instance" "db" {
  db_name    = "airflow"
  identifier = "${var.project_name}-metadata-<%= expansion(':ENV') %>"
  username   = var.metadata_db_usr
  password   = var.metadata_db_pw

  storage_type   = "gp2"
  engine         = "postgres"
  engine_version = "11.13"
  instance_class = "db.t3.small"

  allocated_storage     = 10
  max_allocated_storage = 20

  db_subnet_group_name   = var.database_subnet_group_name
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db.id]
  tags = var.tags
} 

resource "aws_security_group" "db" {
  name_prefix = "${var.project_name}-sg-database"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
      "20.0.0.0/8",
    ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  tags = var.tags
}

resource "aws_ssm_parameter" "cluster_var_metadata_db_conn" {
  name        = "/${var.project_name}/${var.workflow_env}/cluster/variables/metadata-db-conn"
  description = "Cluster Variable Metadata DB Conenction String"
  type        = "SecureString"
  value       = "postgresql://${aws_db_instance.db.username}:${aws_db_instance.db.password}@${aws_db_instance.db.endpoint}/airflow"
}

resource "aws_ssm_parameter" "cluster_var_metadata_db_conn-init" {
  name        = "/${var.project_name}/${var.workflow_env}/cluster/variables/metadata-db-conn-init"
  description = "Cluster Variable Metadata DB Conenction String"
  type        = "SecureString"
  value       = "postgresql+psycopg2://${aws_db_instance.db.username}:${aws_db_instance.db.password}@${aws_db_instance.db.endpoint}/airflow"
}

################################################################################
#  Redshift
################################################################################
resource "aws_redshift_cluster" "cluster" {
  cluster_identifier = "${var.project_name}<%= expansion(':ENV') %>"
  database_name      = var.database_name
  master_username    = var.redshift_dw_user
  master_password    = var.redshift_dw_pw
  node_type          = "dc2.large"
  cluster_type = "single-node"
  vpc_security_group_ids    = [aws_security_group.redshift.id]
  cluster_subnet_group_name = var.redshift_subnet_group_name
  availability_zone         = "us-east-2a"
  port                      = "5439"
  number_of_nodes           = 1
  publicly_accessible       = false
  encrypted                 = false
  skip_final_snapshot       = true
  tags                      = var.tags
  iam_roles                 = [aws_iam_role.role.arn]
}

resource "aws_security_group" "redshift" {
  name_prefix = "${var.project_name}-sg-redshift"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
      "20.0.0.0/8",
    ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  tags = var.tags
}

resource "aws_iam_role" "role" {
  name = "${var.project_name}-redshift-spectrum-role<%= expansion(':ENV') %>"

  assume_role_policy = data.aws_iam_policy_document.assume_policy_document.json

  managed_policy_arns = [data.aws_iam_policy.amazon_redshift_all_commands.arn, data.aws_iam_policy.secret_manager_full.arn]
  path                = "/"

  inline_policy {
    name   = "redshift_s3_access"
    policy = data.aws_iam_policy_document.redshift_s3_access.json
  }

  tags = var.tags
}

data "aws_iam_policy" "secret_manager_full" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

data "aws_iam_policy" "glue_console_access" {
  arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}

data "aws_iam_policy" "amazon_redshift_all_commands" {
  arn = "arn:aws:iam::aws:policy/AmazonRedshiftAllCommandsFullAccess"
}

data "aws_iam_policy_document" "assume_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }
  }
}

resource "aws_ssm_parameter" "redshift_s3_bucket" {
  name        = "/${var.project_name}/${var.workflow_env}/orchestrator/variables/target-redshift-landing-bucket"
  description = "Redshift Landing Bucket"
  type        = "String"
  value       = module.s3_bucket.s3_bucket_id
}

resource "aws_ssm_parameter" "redshift_pw" {
  name        = "/${var.project_name}/${var.workflow_env}/orchestrator/variables/target-redshift-pw"
  description = "Redshift Password"
  type        = "SecureString"
  value       = aws_redshift_cluster.cluster.master_password
}

resource "aws_ssm_parameter" "redshift_usr" {
  name        = "/${var.project_name}/${var.workflow_env}/orchestrator/variables/target-redshift-usr"
  description = "Redshift Password"
  type        = "SecureString"
  value       = aws_redshift_cluster.cluster.master_username
}

resource "aws_ssm_parameter" "redshift_host" {
  name        = "/${var.project_name}/${var.workflow_env}/orchestrator/variables/target-redshift-host"
  description = "Redshift Password"
  type        = "String"
  value       = aws_redshift_cluster.cluster.dns_name
}

################################################################################
# S3 
################################################################################
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.2.0"
  bucket = "${var.project_name}-redshift-landing<%= expansion(':ENV') %>"

  tags = var.tags

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

data "aws_iam_policy_document" "redshift_s3_access" {
  statement {
    effect = "Allow"

    actions   = ["s3:ListBucket"]
    resources = ["${module.s3_bucket.s3_bucket_arn}", "${module.s3_bucket.s3_bucket_arn}/*"]
  }

  statement {
    effect = "Allow"

    actions   = ["s3:*"]
    resources = ["${module.s3_bucket.s3_bucket_arn}", "${module.s3_bucket.s3_bucket_arn}/*"]
  }
}

resource "aws_iam_user" "redshift_bucket_user" {
  name = "redshift-bucket-access<%= expansion(':ENV') %>"
  path = "/system/"
}

resource "aws_iam_access_key" "redshift_bucket_user" {
  user = aws_iam_user.redshift_bucket_user.name
}

resource "aws_iam_user_policy" "redshift_bucket_user" {
  name   = "redshift-bucket-access-policy<%= expansion(':ENV') %>"
  user   = aws_iam_user.redshift_bucket_user.name
  policy = data.aws_iam_policy_document.redshift_s3_access.json
} 