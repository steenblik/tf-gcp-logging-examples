## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.30.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.30.0 |

## Resources

| Name | Type |
|------|------|
| [google_logging_project_sink.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigquery_partitioned_tables"></a> [bigquery\_partitioned\_tables](#input\_bigquery\_partitioned\_tables) | Should sinks exporting data to BigQuery use partitioned tables? | `any` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Human-readable description for the log sink. | `string` | `"Terraform managed"` | no |
| <a name="input_destination"></a> [destination](#input\_destination) | The resource self\_link id of the destination to route logs to. Can be a GCS bucket, BigQuery table, PubSub topic, or Logging bucket. | `string` | n/a | yes |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | Should the logging sink be disabled. | `bool` | `false` | no |
| <a name="input_exclusions"></a> [exclusions](#input\_exclusions) | (Optional) A list of sink exclusion filters. | <pre>list(object({<br>    name        = string,<br>    description = string,<br>    filter      = string,<br>    disabled    = bool<br>  }))</pre> | `[]` | no |
| <a name="input_filter"></a> [filter](#input\_filter) | The cloud logging filter used to include/match logs to route to the destination. Special case filters named "DEFAULT" and "REQUIRED" replicate the filters used on the pre-existing sinks. An empty string "" matches all logs. | `string` | `"DEFAULT"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the logging sink. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | ID of the project where the logging sink will be created. | `string` | `null` | no |
| <a name="input_unique_writer"></a> [unique\_writer](#input\_unique\_writer) | Whether or not to create a unique identity associated with this sink. If false (the default), then the writer\_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created sink. |
| <a name="output_name"></a> [name](#output\_name) | Name of the created sink. |
| <a name="output_writer_identity"></a> [writer\_identity](#output\_writer\_identity) | Identity associated with sink. |
