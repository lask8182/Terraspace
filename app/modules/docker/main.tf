## Create ECR repository
resource "aws_ecr_repository" "repo" {
  name = "${var.ecr_name}<%= expansion(':ENV') %>"
}

resource "aws_ecr_lifecycle_policy" "repo-policy" {
  repository = aws_ecr_repository.repo.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

## Build docker images and push to ECR
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

resource "docker_registry_image" "this" {
    name = "${aws_ecr_repository.repo.repository_url}:${var.workflow_env}"
    
    build {
      context = "./"
      dockerfile = "Dockerfile"
    }  
}

## Setup proper credentials to push to ECR
data "aws_ecr_authorization_token" "token" {}

provider "docker" {
  registry_auth {
    address  = "<%= expansion(':ACCOUNT') %>.dkr.ecr.<%= expansion(':REGION') %>.amazonaws.com"
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}