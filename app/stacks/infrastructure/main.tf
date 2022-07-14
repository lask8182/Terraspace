module "infrastructure" {
  source = "../../modules/infrastructure"
  tags = var.tags
  project_name = var.project_name
  # VPC
  create_vpc = var.create_vpc
  cidr = var.vpc_cidr
  azs = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  redshift_subnets = var.redshift_subnets
  database_subnets = var.database_subnets
  # S3
  block_public_acls = var.s3_block_public_acls
  block_public_policy = var.s3_block_public_policy
  ignore_public_acls = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
  create_bucket = var.s3_create_bucket
  # EKS
  create = var.eks_create
  cluster_version = var.eks_cluster_version
  cluster_endpoint_private_access = var.eks_cluster_endpoint_private_access
  cluster_endpoint_public_access = var.eks_cluster_endpoint_public_access
  instance_type = var.eks_nodes_instance_type
  aws_auth_roles = var.eks_aws_auth_roles
  aws_auth_users = var.eks_aws_auth_users
  aws_auth_accounts = var.eks_aws_auth_accounts
  min_size = var.eks_nodes_min_size
  max_size = var.eks_nodes_max_size
  desired_capacity = var.eks_nodes_desired_capacity
  capacity_type = var.eks_nodes_capacity_type
  # EKS Resources
  enable_grafana_prometheus = var.enable_grafana_prometheus
}
