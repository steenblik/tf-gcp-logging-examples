variable "description" {
  description = "Human-readable description for the logging bucket."
  type        = string
  default     = "Terraform managed"
}

variable "id" {
  description = "Name of the logging bucket."
  type        = string
}

variable "location" {
  description = "Location of the bucket."
  type        = string
  default     = "global"
}

variable "project" {
  description = "ID of the project where the logging bucket will be created."
  type        = string
  default     = null
}

variable "retention_days" {
  description = "Retention time in days for the logging bucket."
  type        = number
  default     = 30
}
