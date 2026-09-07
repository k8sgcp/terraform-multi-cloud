variable "project_id" {
type = string
description = "GCP project ID"
}


variable "zone" {
type = string
description = "Target GCP zone"
default = "us-central1-a"
}


variable "instance_name" {
type = string
description = "GCP compute instance name"
}


variable "machine_type" {
type = string
description = "GCE instance machine type"
default = "e2-micro"
}


variable "subnet_id" {
type = string
description = "ID of VPC subnet"
}
