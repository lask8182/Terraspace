################################################################################
# VPC Module
################################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.infrastructure.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.infrastructure.private_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.infrastructure.database_subnets
}

output "database_subnet_group_name" {
  description = "List of IDs of database subnets"
  value       = module.infrastructure.database_subnet_group_name
}

output "redshift_subnet_group" {
  description = "ID of redshift subnet group"
  value       = module.infrastructure.redshift_subnet_group
}
################################################################################
# ECR Module
################################################################################

################################################################################
# S3 Module
################################################################################

################################################################################
# EKS Module
################################################################################
output "cluster_id" {
  description = "The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready"
  value       = module.infrastructure.cluster_id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.infrastructure.cluster_arn
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.infrastructure.cluster_certificate_authority_data
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = module.infrastructure.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "ID of the cluster security group"
  value       = module.infrastructure.cluster_security_group_id
}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC Provider if `enable_irsa = true`"
  value       = module.infrastructure.oidc_provider_arn
}

output "oidc_provider" {
  description = "The OpenID Connect identity provider (issuer URL without leading `https://`)"
  value       = module.infrastructure.oidc_provider
}