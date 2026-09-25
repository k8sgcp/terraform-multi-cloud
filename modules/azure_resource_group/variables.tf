variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region for resource deployment"
  default     = "East US"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
