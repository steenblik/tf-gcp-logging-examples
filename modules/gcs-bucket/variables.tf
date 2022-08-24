variable "encryption_key" {
  description = "KMS key that will be used for encryption."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Optional map to set force destroy keyed by name, defaults to false."
  type        = bool
  default     = false
}

variable "iam" {
  description = "IAM bindings in {ROLE => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}

variable "labels" {
  description = "Labels to be attached to bucket."
  type        = map(string)
  default     = {}
}

variable "lifecycle_rules" {
  description = "Bucket lifecycle rules."
  type = list(object({
    action = object({
      type          = string
      storage_class = optional(string)
    })
    condition = object({
      age                        = optional(number)
      created_before             = optional(string)
      with_state                 = optional(string)
      matches_storage_class      = optional(list(string))
      num_newer_versions         = optional(string)
      custom_time_before         = optional(string)
      days_since_custom_time     = optional(string)
      days_since_noncurrent_time = optional(string)
      noncurrent_time_before     = optional(string)
    })
  }))
  default = null
}

variable "location" {
  description = "Bucket location."
  type        = string
  default     = "europe-west3"
}

variable "logging_config" {
  description = "Bucket logging configuration."
  type = object({
    log_bucket        = string
    log_object_prefix = string
  })
  default = null
}

variable "name" {
  description = "Bucket name."
  type        = string
}

variable "project" {
  description = "Bucket project id."
  type        = string
  default     = null
}

variable "retention_policy" {
  description = "Bucket retention policy."
  type = object({
    retention_period = number
    is_locked        = bool
  })
  default = null
}

variable "storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "STANDARD"
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.storage_class)
    error_message = "Storage class must be one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}

variable "uniform_bucket_level_access" {
  description = "Allow using object ACLs (false) or not (true, this is the recommended behavior) , defaults to true (which is the recommended practice, but not the behavior of storage API)."
  type        = bool
  default     = true
}

variable "versioning" {
  description = "Enable versioning, defaults to false."
  type        = bool
  default     = false
}
