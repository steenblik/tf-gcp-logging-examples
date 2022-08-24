locals {
  retention = 3650
}

provider "google" {
  project = var.project
  # Region and location are not the same but let's pretend ;)
  region = var.location
}

data "google_project" "this" {
  project_id = var.project
}

module "archive-bucket" {
  depends_on     = [google_kms_crypto_key_iam_member.this]
  source         = "../../modules/gcs-bucket"
  name           = "${var.location}-log-archive-${data.google_project.this.number}"
  location       = var.location
  storage_class  = "NEARLINE"
  encryption_key = google_kms_crypto_key.this.id

  lifecycle_rules = [
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "COLDLINE"
      }
      condition = {
        age = 90
      }
    },
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "ARCHIVE"
      }
      condition = {
        age = 365
      }
    },
    {
      action = {
        type = "Delete"
      }
      condition = {
        age = local.retention
      }
    }
  ]

  retention_policy = {
    retention_period = local.retention
    is_locked        = false
  }

}

module "archive-sink" {
  source      = "../../modules/project-sink"
  name        = "${var.location}-log-archive"
  destination = "storage.googleapis.com/${module.archive-bucket.name}"
  filter      = "DEFAULT"
}

resource "google_storage_bucket_iam_member" "this" {
  bucket = module.archive-bucket.name
  role   = "roles/storage.objectCreator"
  member = module.archive-sink.writer_identity
}
