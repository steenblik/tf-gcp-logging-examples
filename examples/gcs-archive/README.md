# GCS Log Archive
This example creates a GCS log sink to be used as a log archive. Lifecycle rules are used to migrate objects to more affordable storage classes based on object age.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_archive-bucket"></a> [archive-bucket](#module\_archive-bucket) | ../../modules/gcs-bucket | n/a |
| <a name="module_archive-sink"></a> [archive-sink](#module\_archive-sink) | ../../modules/project-sink | n/a |

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket_iam_member.member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The region or location to use when creating resources. | `string` | `"europe-west3"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project to create resources in. | `string` | n/a | yes |
