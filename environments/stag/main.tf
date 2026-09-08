terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "ms-solutionist-tfstate-stag"
    prefix = "terraform/state/stag"
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

# 1. State Bucket Module
module "stag_state_bucket" {
  source      = "../../modules/gcp_state_bucket"
  project_id  = var.project_id
  bucket_name = "ms-solutionist-tfstate-stag"
  location    = var.region
}

# 2. Network Module
module "stag_network" {
  source       = "../../modules/gcp_network"
  project_id   = var.project_id
  network_name     = "stag-vpc"
  subnet_name  = "stag-subnet"
  subnet_cidr  = "10.2.0.0/16"
  region       = var.region
}

# 3. IAM Module
module "stag_iam" {
  source             = "../../modules/gcp_iam"
  project_id         = var.project_id
  service_account_id = "stag-app-sa"
  display_name       = "Staging Environment Service Account"
  role               = "roles/editor"
}
