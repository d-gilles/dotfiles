variable "project_id" {
  description = "The project ID to deploy to"
}

variable "region" {
  description = "The region to deploy to"
}

variable "zone" {
  description = "The zone within the region"
}

variable "tf_service_account" {
  description = "Service account to impersonate for Terraform"
}
