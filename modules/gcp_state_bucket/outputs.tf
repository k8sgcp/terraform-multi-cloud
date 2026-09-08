output "bucket_name" {
value = google_storage_bucket.state_bucket.name
description = "The name of backend state bucket"
}
