variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach the VM network interface"
}

variable "vm_size" {
  type        = string
  description = "Size of the Azure VM (B1s is low cost / free-tier eligible)"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for VM authentication"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
