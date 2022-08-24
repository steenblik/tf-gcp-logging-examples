resource "google_storage_bucket" "this" {
  name                        = lower(var.name)
  project                     = var.project
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels                      = var.labels
  versioning {
    enabled = var.versioning
  }

  dynamic "encryption" {
    for_each = var.encryption_key == null ? [] : [""]

    content {
      default_kms_key_name = var.encryption_key
    }
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [""]
    content {
      retention_period = var.retention_policy.retention_period
      is_locked        = var.retention_policy.is_locked
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action["type"]
        storage_class = lifecycle_rule.value.action["storage_class"]
      }
      condition {
        age                        = lifecycle_rule.value.condition["age"]
        created_before             = lifecycle_rule.value.condition["created_before"]
        with_state                 = lifecycle_rule.value.condition["with_state"]
        matches_storage_class      = lifecycle_rule.value.condition["matches_storage_class"]
        num_newer_versions         = lifecycle_rule.value.condition["num_newer_versions"]
        custom_time_before         = lifecycle_rule.value.condition["custom_time_before"]
        days_since_custom_time     = lifecycle_rule.value.condition["days_since_custom_time"]
        days_since_noncurrent_time = lifecycle_rule.value.condition["days_since_noncurrent_time"]
        noncurrent_time_before     = lifecycle_rule.value.condition["noncurrent_time_before"]
      }
    }
  }
}