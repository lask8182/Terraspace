<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.13 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.16.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 1.0, < 3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.13 |
| <a name="provider_docker"></a> [docker](#provider\_docker) | 2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.repo-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [docker_registry_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/registry_image) | resource |
| [aws_ecr_authorization_token.token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_authorization_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_name"></a> [ecr\_name](#input\_ecr\_name) | n/a | `any` | n/a | yes |
| <a name="input_workflow_env"></a> [workflow\_env](#input\_workflow\_env) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | ECR repository URL of Docker image |
<!-- END_TF_DOCS -->