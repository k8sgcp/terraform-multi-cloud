output "prod_bucket_name" {
  value       = module.prod_state_bucket.bucket_name
  description = "Created state bucket for production"
}

output "prod_vpc_id" {
  value       = module.prod_network.network_id
  description = "Created VPC ID for production"
}

output "prod_subnet_id" {
  value       = module.prod_network.subnet_id
  description = "Created Subnet ID for production"
}

output "prod_sa_email" {
  value       = module.prod_iam.service_account_email
  description = "Created Service Account email for production"
}
