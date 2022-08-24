locals {
  filter_to_file = {
    DEFAULT  = file("${path.module}/filters/DEFAULT")
    REQUIRED = file("${path.module}/filters/REQUIRED")
  }
  filter = try(
    local.filter_to_file[var.filter],
    var.filter,
    null
  )
}
resource "google_logging_project_sink" "this" {
  name        = var.name
  description = var.description
  project     = var.project
  destination = var.destination
  filter      = local.filter
  disabled    = var.disabled
  // https://github.com/hashicorp/terraform-provider-google/issues/12308
  unique_writer_identity = var.unique_writer

  dynamic "bigquery_options" {
    for_each = contains(["bigquery"], split("/", var.destination)[0]) ? [true] : []
    content {
      use_partitioned_tables = var.bigquery_partitioned_tables
    }
  }

  dynamic "exclusions" {
    for_each = var.exclusions
    content {
      name        = exclusions.value.name
      description = exclusions.value.description
      filter      = exclusions.value.filter
      disabled    = exclusions.value.disabled
    }
  }
}
