<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_workflow"></a> [workflow](#module\_workflow) | ../../modules/workflow | n/a |

## Resources

No resources.

## Inputs

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

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_redshift_cluster_arn"></a> [aws\_redshift\_cluster\_arn](#output\_aws\_redshift\_cluster\_arn) | Redshift ARN |
| <a name="output_aws_redshift_cluster_endpoint"></a> [aws\_redshift\_cluster\_endpoint](#output\_aws\_redshift\_cluster\_endpoint) | Redshift Endpoint |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | RDS ARN |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | RDS Endpoint |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | S3 ARN |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | S3 id |
<!-- END_TF_DOCS -->