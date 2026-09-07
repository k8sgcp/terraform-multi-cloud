output "test_bucket_name" {
  value       = module.test_state_bucket.bucket_name
  description = "Created state bucket name for test"
}

output "test_sa_email" {
  value       = module.test_iam.service_account_email
  description = "Created service account email for test"
}
