output "name" {
  description = "Name of the created sink."
  value       = google_logging_project_sink.this.name
}

output "id" {
  description = "ID of the created sink."
  value       = google_logging_project_sink.this.id
}

output "writer_identity" {
  description = "Identity associated with sink."
  value       = google_logging_project_sink.this.writer_identity
}