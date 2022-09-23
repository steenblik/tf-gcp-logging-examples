/*
In order to use the existing _Default bucket it needs to be first imported into
the Terraform state.

$ terraform import module.default-bucket.google_logging_project_bucket_config.this projects/${PROJECT_ID}/locations/global/buckets/_Default

If the _Default bucket is imported, then before destroying these terraform
resources the sink will need to be removed from the state with.

$ terraform state rm module.default-bucket.google_logging_project_bucket_config.this
*/

provider "google" {
  project = var.project
}

module "default-bucket" {
  source         = "../../modules/log-bucket"
  project        = var.project
  location       = "global"
  id             = "_Default"
  retention_days = 30
}
