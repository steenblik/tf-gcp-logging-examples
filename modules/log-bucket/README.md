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
| [google_logging_project_bucket_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_bucket_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Human-readable description for the logging bucket. | `string` | `"Terraform managed"` | no |
| <a name="input_id"></a> [id](#input\_id) | Name of the logging bucket. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the bucket. | `string` | `"global"` | no |
| <a name="input_project"></a> [project](#input\_project) | ID of the project where the logging bucket will be created. | `string` | `null` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | Retention time in days for the logging bucket. | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created bucket. |
| <a name="output_lifecycle_state"></a> [lifecycle\_state](#output\_lifecycle\_state) | Status of the created bucket. |
| <a name="output_name"></a> [name](#output\_name) | Name of the created bucket. |
