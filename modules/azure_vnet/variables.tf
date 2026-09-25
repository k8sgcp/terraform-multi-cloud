variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name where VNet resides"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "address_space" {
  type        = list(string)
  description = "CIDR block for the VNet"
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  type        = map(string)
  description = "Map of subnet name to CIDR prefix"
  default     = {}
}

variable "tags" {
  type        = map(string)
  default     = {}
}
