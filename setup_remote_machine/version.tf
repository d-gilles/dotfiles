terraform {
  required_version = "~> 1.5.0"
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.64.0"
    }
  }
}
