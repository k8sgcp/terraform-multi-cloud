terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "ms-solutionist-tfstate-prod"
    prefix = "terraform/state/prod"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}



# 1. State Bucket Module
module "prod_state_bucket" {
  source      = "../../modules/gcp_state_bucket"
  project_id  = var.project_id
  bucket_name = "ms-solutionist-tfstate-prod"
  location    = var.region
}

# 2. Network Module
module "prod_network" {
  source       = "../../modules/gcp_network"
  project_id   = var.project_id
  region       = var.region
  network_name = "prod-vpc"
  subnet_name  = "prod-subnet"
  subnet_cidr  = "10.3.0.0/16"
}

# 3. IAM Module
module "prod_iam" {
  source             = "../../modules/gcp_iam"
  project_id         = var.project_id
  service_account_id = "prod-app-sa"
  display_name       = "Production Environment Service Account"
  role               = "roles/editor"
}
