output "network_id" {
  value       = google_compute_network.vpc_network.id
  description = "Id of the created VPC"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "ID of created subnet"
}
