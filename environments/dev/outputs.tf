output "azure_resource_group_name" {
  description = "The name of the Azure resource group"
  value       = module.azure_rg.resource_group_name
}

output "azure_vnet_id" {
  description = "The ID of the Azure virtual network"
  value       = module.azure_network.vnet_id
}

output "azure_vm_public_ip" {
  value       = module.azure_host.public_ip
  description = "Public IP to reach our low-cost container host"
}



# output "vm_public_ip" {
# value = module.compute.public_ip
# }
