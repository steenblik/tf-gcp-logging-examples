terraform {
  required_version = ">= 1.1.0"
  required_providers {
    google = {
      version = ">= 4.30.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}
