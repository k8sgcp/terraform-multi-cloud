output "public_ip" {
  description = "Public IP address of the Azure VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "vm_id" {
  description = "Resource ID of the Azure VM"
  value       = azurerm_linux_virtual_machine.vm.id
}
