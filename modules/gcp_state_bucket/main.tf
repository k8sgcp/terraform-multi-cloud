resource "google_storage_bucket" "state_bucket" {
name                         = var.bucket_name
project                      = var.project_id
location                     = var.location
force_destroy                = false
public_access_prevention     = "enforced"

versioning {
  enabled = true
 }
}
