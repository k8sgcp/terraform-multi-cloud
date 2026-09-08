variable "project_id" {
type         = string
description  = "GCP project id"
}

variable "bucket_name" {
type          = string
description   = "Name of GCS bucket"
}

variable "location" {
type           = string
default        = "us-central1"
description    = "Location of GCS bucket"
}
