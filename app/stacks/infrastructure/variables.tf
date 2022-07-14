################################################################################
# Common tags
################################################################################

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "project_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

################################################################################
# VPC Module
################################################################################

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
}

variable "vpc_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "redshift_subnets" {
  description = "A list of redshift subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "A list of database subnets"
  type        = list(string)
}

################################################################################
# S3 Module
################################################################################

variable "s3_block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
}

variable "s3_block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
}

variable "s3_ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
}

variable "s3_restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
}

variable "s3_create_bucket" {
  description = "Controls if S3 bucket should be created"
  type        = bool
}
################################################################################
# EKS Module
################################################################################
variable "eks_create" {
  description = "Controls if EKS resources should be created (affects nearly all resources)"
  type        = bool
}

variable "eks_cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.21`)"
  type        = string
}

variable "eks_cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
}

variable "eks_cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
}

variable "eks_nodes_instance_type" {
  description = "The type of the instance to launch"
  type        = list(string)
}

variable "eks_aws_auth_roles" {
  description = "List of role maps to add to the aws-auth configmap"
  type        = list(any)
}

variable "eks_aws_auth_users" {
  description = "List of user maps to add to the aws-auth configmap"
  type        = list(any)
}

variable "eks_aws_auth_accounts" {
  description = "List of account maps to add to the aws-auth configmap"
  type        = list(any)
}

variable "eks_nodes_min_size" {
  description = "The minimum size of the autoscaling group"
  type        = number
  default     = null
}

variable "eks_nodes_max_size" {
  description = "The maximum size of the autoscaling group"
  type        = number
  default     = null
}

variable "eks_nodes_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the autoscaling group"
  type        = number
  default     = null
}

variable "eks_nodes_capacity_type" {
  type        = string
  default     = null
}

variable "enable_grafana_prometheus" {
  type = bool
}