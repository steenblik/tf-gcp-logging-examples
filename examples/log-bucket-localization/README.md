# Localized Cloud Logging log bucket & sink
This example creates a localized Cloud Logging bucket and sink. New resources are created leaving the existing `_Default` log bucket and sink in place. In order to use the existing `_Default` sink with a new regionalized log bucket, the `_Default` sink needs to be first imported into
the Terraform state.

## Importing Existing Sink

```
$ terraform import module.default-sink.google_logging_project_sink.this projects/${PROJECT_ID}/sinks/_Default
```

Terraform configuration for the `_Default` sink would look like this and must be in place before the above import.
```
module "default-sink" {
  source        = "../modules/project-sink"
  name          = "_Default"
  project       = "client-service-project"
  destination   = "logging.googleapis.com/${module.bucket.id}"
  filter        = "DEFAULT"
}
```

If the `_Default` sink is imported, then it will need to be removed from the state before destroying these terraform resources>
```
$ terraform state rm module.default-sink.google_logging_project_sink.this
```

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bucket"></a> [bucket](#module\_bucket) | ../../modules/log-bucket | n/a |
| <a name="module_regional-sink"></a> [regional-sink](#module\_regional-sink) | ../../modules/project-sink | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The region or location to use when creating resources. | `string` | `"europe-west3"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project to create resources in. | `string` | n/a | yes |
