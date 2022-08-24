output "name" {
  description = "Name of the created bucket"
  value       = google_storage_bucket.this.name
}

output "id" {
  description = "ID of the created bucket."
  value       = google_storage_bucket.this.url
}

output "self_link" {
  description = "Self link of the created bucket."
  value       = google_storage_bucket.this.self_link
}

output "url" {
  description = "gs:// url of the created bucket."
  value       = google_storage_bucket.this.url
}