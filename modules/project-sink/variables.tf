variable "bigquery_partitioned_tables" {
  description = "Should sinks exporting data to BigQuery use partitioned tables?"
  default     = null
}

variable "description" {
  description = "Human-readable description for the log sink."
  type        = string
  default     = "Terraform managed"
}

variable "destination" {
  description = "The resource self_link id of the destination to route logs to. Can be a GCS bucket, BigQuery table, PubSub topic, or Logging bucket."
  type        = string
}

variable "disabled" {
  description = "Should the logging sink be disabled."
  type        = bool
  default     = false
}

variable "exclusions" {
  description = "(Optional) A list of sink exclusion filters."
  type = list(object({
    name        = string,
    description = string,
    filter      = string,
    disabled    = bool
  }))
  default = []
}

variable "filter" {
  description = "The cloud logging filter used to include/match logs to route to the destination. Special case filters named \"DEFAULT\" and \"REQUIRED\" replicate the filters used on the pre-existing sinks. An empty string \"\" matches all logs."
  type        = string
  default = "DEFAULT"
}

variable "name" {
  description = "The name of the logging sink."
  type        = string
}

variable "project" {
  description = "ID of the project where the logging sink will be created."
  type        = string
  default     = null
}

variable "unique_writer" {
  description = "Whether or not to create a unique identity associated with this sink. If false (the default), then the writer_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink."
  type        = bool
  default     = false
}
