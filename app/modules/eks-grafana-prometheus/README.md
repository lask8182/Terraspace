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
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 1.0, < 3.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 1.10.0, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.grafana](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.prometheus](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_namespace_grafana"></a> [create\_namespace\_grafana](#input\_create\_namespace\_grafana) | Whether to create Grafana Kubernetes namespace with name defined by `namespace`. | `bool` | `true` | no |
| <a name="input_create_namespace_prometheus"></a> [create\_namespace\_prometheus](#input\_create\_namespace\_prometheus) | Whether to create Prometheus Kubernetes namespace with name defined by `namespace`. | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Variable indicating whether deployment is enabled. | `bool` | `true` | no |
| <a name="input_helm_chart_grafana_name"></a> [helm\_chart\_grafana\_name](#input\_helm\_chart\_grafana\_name) | Grafana Helm chart name to be installed | `string` | `"grafana"` | no |
| <a name="input_helm_chart_grafana_release_name"></a> [helm\_chart\_grafana\_release\_name](#input\_helm\_chart\_grafana\_release\_name) | Grafana Helm release name | `string` | `"grafana"` | no |
| <a name="input_helm_chart_grafana_repo"></a> [helm\_chart\_grafana\_repo](#input\_helm\_chart\_grafana\_repo) | Grafana repository name. | `string` | `"https://grafana.github.io/helm-charts"` | no |
| <a name="input_helm_chart_grafana_version"></a> [helm\_chart\_grafana\_version](#input\_helm\_chart\_grafana\_version) | Grafana Helm chart version. | `string` | `"6.15.0"` | no |
| <a name="input_helm_chart_prometheus_name"></a> [helm\_chart\_prometheus\_name](#input\_helm\_chart\_prometheus\_name) | Prometheus Helm chart name to be installed | `string` | `"prometheus"` | no |
| <a name="input_helm_chart_prometheus_release_name"></a> [helm\_chart\_prometheus\_release\_name](#input\_helm\_chart\_prometheus\_release\_name) | Prometheus Helm release name | `string` | `"prometheus"` | no |
| <a name="input_helm_chart_prometheus_repo"></a> [helm\_chart\_prometheus\_repo](#input\_helm\_chart\_prometheus\_repo) | Prometheus repository name. | `string` | `"https://prometheus-community.github.io/helm-charts"` | no |
| <a name="input_helm_chart_prometheus_version"></a> [helm\_chart\_prometheus\_version](#input\_helm\_chart\_prometheus\_version) | Prometheus Helm chart version. | `string` | `"14.5.0"` | no |
| <a name="input_mod_dependency"></a> [mod\_dependency](#input\_mod\_dependency) | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| <a name="input_namespace_grafana"></a> [namespace\_grafana](#input\_namespace\_grafana) | Kubernetes namespace to deploy Grafana stack Helm charts. | `string` | `"grafana"` | no |
| <a name="input_namespace_prometheus"></a> [namespace\_prometheus](#input\_namespace\_prometheus) | Kubernetes namespace to deploy Prometheus stack Helm charts. | `string` | `"prometheus"` | no |
| <a name="input_settings_grafana"></a> [settings\_grafana](#input\_settings\_grafana) | Additional settings which will be passed to Grafana Helm chart values. | `map` | <pre>{<br>  "adminPassword": "admin",<br>  "persistence": {<br>    "enabled": true,<br>    "storageClassName": "gp2"<br>  }<br>}</pre> | no |
| <a name="input_settings_prometheus"></a> [settings\_prometheus](#input\_settings\_prometheus) | Additional settings which will be passed to Prometheus Helm chart values. | `map` | <pre>{<br>  "alertmanager": {<br>    "persistentVolume": {<br>      "storageClass": "gp2"<br>    }<br>  },<br>  "server": {<br>    "persistentVolume": {<br>      "storageClass": "gp2"<br>    }<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->