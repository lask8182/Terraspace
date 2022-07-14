output "db_instance_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.db.endpoint
}

output "db_instance_arn" {
  description = "RDS ARN"
  value       = aws_db_instance.db.arn
}

output "aws_redshift_cluster_endpoint" {
  description = "Redshift Endpoint"
  value       = aws_redshift_cluster.cluster.endpoint
}

output "aws_redshift_cluster_arn" {
  description = "Redshift ARN"
  value       = aws_redshift_cluster.cluster.arn
}

output "s3_bucket_arn" {
  description = "S3 ARN"
  value       = module.s3_bucket.s3_bucket_arn
}

output "s3_bucket_id" {
  description = "S3 id"
  value       = module.s3_bucket.s3_bucket_id
}