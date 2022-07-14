output "repository_url" {
  description = "ECR repository URL of Docker image"
  value       = aws_ecr_repository.repo.repository_url
}

# output "base_image" {
#   description = "ECR repository URL of Docker image"
#   value       = aws_ecr_repository.repo.BASE_URL_NTAG
# }