<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 1.0, < 3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.13 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 1.0, < 3.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.kubernetes_cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.kubernetes_cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.kubernetes_cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [aws_iam_policy_document.kubernetes_cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kubernetes_cluster_autoscaler_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where secrets are stored. | `string` | n/a | yes |
| <a name="input_cluster_identity_oidc_issuer"></a> [cluster\_identity\_oidc\_issuer](#input\_cluster\_identity\_oidc\_issuer) | The OIDC Identity issuer for the cluster. | `string` | n/a | yes |
| <a name="input_cluster_identity_oidc_issuer_arn"></a> [cluster\_identity\_oidc\_issuer\_arn](#input\_cluster\_identity\_oidc\_issuer\_arn) | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create Kubernetes namespace with name defined by `namespace`. | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Variable indicating whether deployment is enabled. | `bool` | `true` | no |
| <a name="input_fullname_override"></a> [fullname\_override](#input\_fullname\_override) | Helm fullnameOverride | `string` | `"aws-cluster-autoscaler"` | no |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | Cluster Autoscaler Helm chart name to be installed | `string` | `"cluster-autoscaler"` | no |
| <a name="input_helm_chart_release_name"></a> [helm\_chart\_release\_name](#input\_helm\_chart\_release\_name) | Helm release name | `string` | `"cluster-autoscaler"` | no |
| <a name="input_helm_chart_repo"></a> [helm\_chart\_repo](#input\_helm\_chart\_repo) | Cluster Autoscaler repository name. | `string` | `"https://kubernetes.github.io/autoscaler"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Cluster Autoscaler Helm chart version. | `string` | `"9.9.2"` | no |
| <a name="input_mod_dependency"></a> [mod\_dependency](#input\_mod\_dependency) | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace to deploy Cluster Autoscaler Helm chart. | `string` | `"kube-system"` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Cluster Autoscaler service account name | `string` | `"cluster-autoscaler"` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Additional settings which will be passed to the Helm chart values. | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->