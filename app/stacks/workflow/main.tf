module "workflow" {
  source = "../../modules/workflow"
  tags = var.tags
  project_name = var.project_name
  workflow_env = var.workflow_env
  vpc_id = var.vpc_id
  # RDS
  metadata_db_usr = var.metadata_db_usr
  metadata_db_pw = var.metadata_db_pw
  database_subnet_group_name = var.database_subnet_group_name
  # Redshift
  database_name = var.database_name
  redshift_dw_user = var.redshift_dw_user
  redshift_dw_pw = var.redshift_dw_pw
  redshift_subnet_group_name = var.redshift_subnet_group_name
  # s3 Redshift 
  block_public_acls = var.block_public_acls
  block_public_policy = var.block_public_policy
  ignore_public_acls = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
