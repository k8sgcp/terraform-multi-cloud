variable "environment" {
  type    = string
  default = "dev"
}

variable "azure_location" {
  type    = string
  default = "East US"
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key content for VM login"
}


variable "aws_region" {
  type    = string
  default = "us-east-1"
}
