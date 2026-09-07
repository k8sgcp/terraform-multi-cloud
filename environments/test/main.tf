terraform {
  required_version = ">= 1.5.0"


backend "gcs" {
    bucket = "ms-solutionist-tfstate-test"
    prefix = "terraform/state/test"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Instantiate State Bucket Module
module "test_state_bucket" {
  source      = "../../modules/gcp_state_bucket"
  project_id  = var.project_id
  bucket_name = "ms-solutionist-tfstate-test"
  location    = var.region
}

# Instantiate IAM Module
module "test_iam" {
  source             = "../../modules/gcp_iam"
  project_id         = var.project_id
  service_account_id = "test-app-sa"
  display_name       = "Test Environment Service Account"
  role               = "roles/viewer"
}
