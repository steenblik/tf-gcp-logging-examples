variable "location" {
  description = "The region or location to use when creating resources."
  type        = string
  default     = "europe-west3"
}

variable "project" {
  description = "The project to create resources in."
  type        = string
}