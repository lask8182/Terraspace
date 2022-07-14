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

variable "workflow_env" {}

################################################################################
# SSM Parameters
################################################################################
# variable "jira_pwd" {}
# variable "jira_usr" {}
variable "metadata_db_usr" {}
variable "metadata_db_pw" {}

# ################################################################################
# # RDS
# ################################################################################
variable "database_subnet_group_name" {
  description = "Name of database subnet group"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = null
}
################################################################################
# Redshift
################################################################################
variable "database_name" {}
variable "redshift_dw_user" {}
variable "redshift_dw_pw" {}

variable "redshift_subnet_group_name" {
  description = "Name of redshift subnet group"
  type        = string
  default     = null
}
################################################################################
# S3
################################################################################

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
}
