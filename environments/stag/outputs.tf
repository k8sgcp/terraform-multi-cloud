output "stag_vpc_id" {
  value       = module.stag_network.network_id
  description = "Created VPC ID for staging"
}

output "stag_subnet_id" {
  value       = module.stag_network.subnet_id
  description = "Created Subnet ID for staging"
}
