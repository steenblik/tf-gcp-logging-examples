resource "google_logging_project_bucket_config" "this" {
  project        = var.id == "_Default" ? "projects/${var.project}" : var.project
  description    = var.description
  location       = var.location
  retention_days = var.retention_days
  bucket_id      = var.id
}

