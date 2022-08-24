# This an example for KMS. In practice this key might be created by by another
# process or in another project
resource "google_kms_key_ring" "this" {
  name     = "logging"
  location = var.location
}

resource "google_kms_crypto_key" "this" {
  name     = "gcs-log-archive"
  key_ring = google_kms_key_ring.this.id

  lifecycle {
    prevent_destroy = true
  }
}

data "google_storage_project_service_account" "this" {
  project = var.project
}

resource "google_kms_crypto_key_iam_member" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${data.google_storage_project_service_account.this.email_address}"
}
