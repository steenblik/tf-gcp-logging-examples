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
| [google_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | KMS key that will be used for encryption. | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Optional map to set force destroy keyed by name, defaults to false. | `bool` | `false` | no |
| <a name="input_iam"></a> [iam](#input\_iam) | IAM bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to be attached to bucket. | `map(string)` | `{}` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | Bucket lifecycle rules. | <pre>list(object({<br>    action = object({<br>      type          = string<br>      storage_class = optional(string)<br>    })<br>    condition = object({<br>      age                        = optional(number)<br>      created_before             = optional(string)<br>      with_state                 = optional(string)<br>      matches_storage_class      = optional(list(string))<br>      num_newer_versions         = optional(string)<br>      custom_time_before         = optional(string)<br>      days_since_custom_time     = optional(string)<br>      days_since_noncurrent_time = optional(string)<br>      noncurrent_time_before     = optional(string)<br>    })<br>  }))</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Bucket location. | `string` | `"europe-west3"` | no |
| <a name="input_logging_config"></a> [logging\_config](#input\_logging\_config) | Bucket logging configuration. | <pre>object({<br>    log_bucket        = string<br>    log_object_prefix = string<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Bucket name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Bucket project id. | `string` | `null` | no |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Bucket retention policy. | <pre>object({<br>    retention_period = number<br>    is_locked        = bool<br>  })</pre> | `null` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Bucket storage class. | `string` | `"STANDARD"` | no |
| <a name="input_uniform_bucket_level_access"></a> [uniform\_bucket\_level\_access](#input\_uniform\_bucket\_level\_access) | Allow using object ACLs (false) or not (true, this is the recommended behavior) , defaults to true (which is the recommended practice, but not the behavior of storage API). | `bool` | `true` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable versioning, defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created bucket. |
| <a name="output_name"></a> [name](#output\_name) | Name of the created bucket |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | Self link of the created bucket. |
| <a name="output_url"></a> [url](#output\_url) | gs:// url of the created bucket. |
