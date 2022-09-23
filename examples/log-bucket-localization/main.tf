provider "google" {
  project = var.project
  # Region and location are not the same but let's pretend ;)
  region = var.location
}

module "bucket" {
  source   = "../../modules/log-bucket"
  location = var.location
  id       = "${var.location}-default"
  project = var.project
}

/*
In order to use the existing _Default sink it needs to be first imported into
the Terraform state.

$ terraform import module.default-sink.google_logging_project_sink.this projects/${PROJECT_ID}/sinks/_Default

If the _Default sink is imported, then before destroying these terraform
resources the sink will need to be removed from the state with.

$ terraform state rm module.default-sink.google_logging_project_sink.this

module "default-sink" {
  source        = "../modules/project-sink"
  name          = "_Default"
  project       = "client-service-project"
  destination   = "logging.googleapis.com/${module.bucket.id}"
  filter        = "DEFAULT"
}
*/

module "regional-sink" {
  source        = "../../modules/project-sink"
  name          = "${var.location}-default"
  destination   = "logging.googleapis.com/${module.bucket.id}"
  unique_writer = true
  filter        = "DEFAULT"
}
