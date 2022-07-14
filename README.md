<!-- BEGIN_TF_DOCS -->
## Usage
**To create a new environment**
```
AWS_PROFILE=luan-poc AWS_REGION=us-east-1 CLIENTE=Luan TS_ENV=dev terraspace seed <stack_name>
```
```
  edit and copy dev.tfvars file
  create tfvars layering directory structure: <stack>/<tfvars>/<cliente>/<region>/paste-file.tfvars (see stack example)
```
```
AWS_PROFILE=luan-poc AWS_REGION=us-east-1 CLIENTE=Luan TS_ENV=dev terraspace up <stack_name>
```

**To destroy an environment**
```
AWS_PROFILE=luan-poc AWS_REGION=us-east-1 CLIENTE=Luan TS_ENV=dev terraspace down <stack_name>
```

**How to use stacks outputs** - 
in the dev.tfvars file put value for variable like this:
(see stack example/tfvars/cliente-name/us-east-1/dev.tfvars)
```
vpc_id = "<%= output('vpc.vpc_id') %>"
variable = "<%= output('stack-name.output-name') %>"
```

**How to use ssm variables** - 
in the dev.tfvars file put value for variable like this:
(see stack example/tfvars/cliente-name/us-east-1/dev.tfvars)
```
db_password = "<%= aws_ssm("mangodb-passwd") %>"
db_password = "<%= aws_ssm("parameter-name") %>"
```


## Requirements 
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_terraspace"></a> [terraspace](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_docker"></a> [docker](#requirement\_terraform) | >= 20.10 |

## Terraform Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 1.0, < 3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Terraform Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.13 |
| <a name="provider_null"></a> [null](#provider\_null) | 
| <a name="provider_docker"></a> [docker](#provider\_docker) | 2.16.0 |

## Terraform Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infrastructure"></a> [infrastructure](#module\_infrastructure) | ../../modules/infrastructure | n/a |
| <a name="module_docker"></a> [docker](#module\_docker) | ../../modules/docker | n/a |
| <a name="module_workflow"></a> [workflow](#module\_workflow) | ../../modules/workflow | n/a |

## Infrastructure Stack Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | Controls if VPC should be created (it affects almost all resources) | `bool` | n/a | yes |
| <a name="input_csi_service_account"></a> [csi\_service\_account](#input\_csi\_service\_account) | CSI Service Account name  | `any` | n/a | yes |
| <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets) | A list of database subnets | `list(string)` | n/a | yes |
| <a name="input_eks_aws_auth_accounts"></a> [eks\_aws\_auth\_accounts](#input\_eks\_aws\_auth\_accounts) | List of account maps to add to the aws-auth configmap | `list(any)` | n/a | yes |
| <a name="input_eks_aws_auth_roles"></a> [eks\_aws\_auth\_roles](#input\_eks\_aws\_auth\_roles) | List of role maps to add to the aws-auth configmap | `list(any)` | n/a | yes |
| <a name="input_eks_aws_auth_users"></a> [eks\_aws\_auth\_users](#input\_eks\_aws\_auth\_users) | List of user maps to add to the aws-auth configmap | `list(any)` | n/a | yes |
| <a name="input_eks_cluster_endpoint_private_access"></a> [eks\_cluster\_endpoint\_private\_access](#input\_eks\_cluster\_endpoint\_private\_access) | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` | n/a | yes |
| <a name="input_eks_cluster_endpoint_public_access"></a> [eks\_cluster\_endpoint\_public\_access](#input\_eks\_cluster\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled | `bool` | n/a | yes |
| <a name="input_eks_cluster_version"></a> [eks\_cluster\_version](#input\_eks\_cluster\_version) | Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.21`) | `string` | n/a | yes |
| <a name="input_eks_create"></a> [eks\_create](#input\_eks\_create) | Controls if EKS resources should be created (affects nearly all resources) | `bool` | n/a | yes |
| <a name="input_eks_nodes_capacity_type"></a> [eks\_nodes\_capacity\_type](#input\_eks\_nodes\_capacity\_type) | Type of capacity associated with the EKS Node Group. Valid values: "ON\_DEMAND", "SPOT", or `null`.<br>Terraform will only perform drift detection if a configuration value is provided. | `string` | `null` | no |
| <a name="input_eks_nodes_desired_capacity"></a> [eks\_nodes\_desired\_capacity](#input\_eks\_nodes\_desired\_capacity) | The number of Amazon EC2 instances that should be running in the autoscaling group | `number` | `null` | no |
| <a name="input_eks_nodes_instance_type"></a> [eks\_nodes\_instance\_type](#input\_eks\_nodes\_instance\_type) | The type of the instance to launch | `list(string)` | n/a | yes |
| <a name="input_eks_nodes_max_size"></a> [eks\_nodes\_max\_size](#input\_eks\_nodes\_max\_size) | The maximum size of the autoscaling group | `number` | `null` | no |
| <a name="input_eks_nodes_min_size"></a> [eks\_nodes\_min\_size](#input\_eks\_nodes\_min\_size) | The minimum size of the autoscaling group | `number` | `null` | no |
| <a name="input_enable_grafana_prometheus"></a> [enable\_grafana\_prometheus](#input\_enable\_grafana\_prometheus) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of private subnets inside the VPC | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name to be used on all the resources as identifier | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of public subnets inside the VPC | `list(string)` | n/a | yes |
| <a name="input_redshift_subnets"></a> [redshift\_subnets](#input\_redshift\_subnets) | A list of redshift subnets | `list(string)` | n/a | yes |
| <a name="input_s3_block_public_acls"></a> [s3\_block\_public\_acls](#input\_s3\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | n/a | yes |
| <a name="input_s3_block_public_policy"></a> [s3\_block\_public\_policy](#input\_s3\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | n/a | yes |
| <a name="input_s3_create_bucket"></a> [s3\_create\_bucket](#input\_s3\_create\_bucket) | Controls if S3 bucket should be created | `bool` | n/a | yes |
| <a name="input_s3_ignore_public_acls"></a> [s3\_ignore\_public\_acls](#input\_s3\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | n/a | yes |
| <a name="input_s3_restrict_public_buckets"></a> [s3\_restrict\_public\_buckets](#input\_s3\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | A list of availability zones names or ids in the region | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | n/a | yes |

## Infrastructure Stack Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The Amazon Resource Name (ARN) of the cluster |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Base64 encoded certificate data required to communicate with the cluster |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for your Kubernetes API server |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | ID of the cluster security group |
| <a name="output_database_subnet_group_name"></a> [database\_subnet\_group\_name](#output\_database\_subnet\_group\_name) | List of IDs of database subnets |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of database subnets |
| <a name="output_oidc_provider"></a> [oidc\_provider](#output\_oidc\_provider) | The OpenID Connect identity provider (issuer URL without leading `https://`) |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | The ARN of the OIDC Provider if `enable_irsa = true` |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_redshift_subnet_group"></a> [redshift\_subnet\_group](#output\_redshift\_subnet\_group) | ID of redshift subnet group |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |

## Workflow Stack Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | n/a | yes |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Redshift Database Name | `any` | n/a | yes |
| <a name="input_database_subnet_group_name"></a> [database\_subnet\_group\_name](#input\_database\_subnet\_group\_name) | Name of database subnet group | `string` | `null` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | n/a | yes |
| <a name="input_metadata_db_pw"></a> [metadata\_db\_pw](#input\_metadata\_db\_pw) | Parameter Store output by manual password input | `any` | n/a | yes |
| <a name="input_metadata_db_usr"></a> [metadata\_db\_usr](#input\_metadata\_db\_usr) | Parameter Store output by manual user input | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name to be used on all the resources as identifier | `string` | n/a | yes |
| <a name="input_redshift_dw_pw"></a> [redshift\_dw\_pw](#input\_redshift\_dw\_pw) | n/a | `any` | n/a | yes |
| <a name="input_redshift_dw_user"></a> [redshift\_dw\_user](#input\_redshift\_dw\_user) | n/a | `any` | n/a | yes |
| <a name="input_redshift_subnet_group_name"></a> [redshift\_subnet\_group\_name](#input\_redshift\_subnet\_group\_name) | Name of redshift subnet group | `string` | `null` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | `null` | no |
| <a name="input_workflow_env"></a> [workflow\_env](#input\_workflow\_env) | ENV of the workload | `any` | n/a | yes |

## Workflow Stack Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_redshift_cluster_arn"></a> [aws\_redshift\_cluster\_arn](#output\_aws\_redshift\_cluster\_arn) | Redshift ARN |
| <a name="output_aws_redshift_cluster_endpoint"></a> [aws\_redshift\_cluster\_endpoint](#output\_aws\_redshift\_cluster\_endpoint) | Redshift Endpoint |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | RDS ARN |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | RDS Endpoint |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | S3 ARN |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | S3 id |

<!-- END_TF_DOCS -->