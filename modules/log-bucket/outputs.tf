output "name" {
  description = "Name of the created bucket."
  value       = google_logging_project_bucket_config.this.name
}

output "id" {
  description = "ID of the created bucket."
  value       = google_logging_project_bucket_config.this.id
}

output "lifecycle_state" {
  description = "Status of the created bucket."
  value       = google_logging_project_bucket_config.this.lifecycle_state
}
