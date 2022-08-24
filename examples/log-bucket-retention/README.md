# Change the retention on an existing Cloud Logging bucket
This is an example of how to change the retention on an existing log bucket (usually `_Default`). It typically makes more sense to create a [new](../log-bucket-location/README.md) Cloud Logging bucket rather than changing the existing bucket.
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_default-bucket"></a> [default-bucket](#module\_default-bucket) | ../../modules/log-bucket | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | The project to create resources in. | `string` | n/a | yes |
