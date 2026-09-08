variable "project_id" {
type = string
description = "GCP project ID"
}


variable "service_account_id" {
type = string
description = "Unique ID for service account"
}


variable "display_name" {
type = string
description = "Display name for service account"
}

variable "role" {
type = string
description = "Role assigned to service account"
}
