variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "GCP Region"
}

variable "network_name" {
type          = string
description   = "Name of VPC network"
}



variable "subnet_cidr" {
type            = string
default         = "10.0.1.0/24"
description     = "Primary subnet CIDR range"
}


variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}
