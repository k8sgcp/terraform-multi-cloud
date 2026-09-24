# Instantiate Azure Resource Group
module "azure_rg" {
  source              = "../../modules/azure_resource_group"
  resource_group_name = "rg-${var.environment}-eastus"
  location            = var.azure_location
  tags                = var.common_tags
}

# Instantiate Azure VNet
module "azure_network" {
  source              = "../../modules/azure_vnet"
  vnet_name           = "vnet-${var.environment}-01"
  resource_group_name = module.azure_rg.resource_group_name
  location            = module.azure_rg.location
  address_space       = ["10.10.0.0/16"]
  subnets = {
    "snet-app"  = "10.10.1.0/24"
    "snet-data" = "10.10.2.0/24"
  }
  tags = var.common_tags
}


# Instantiate Azure VM
module "azure_host" {
  source              = "../../modules/azure_vm"
  vm_name             = "vm-${var.environment}-dotnet-01"
  resource_group_name = module.azure_rg.resource_group_name
  location            = module.azure_rg.location
  subnet_id           = module.azure_network.subnet_ids["snet-app"]
  ssh_public_key      = var.ssh_public_key
  vm_size             = "Standard_B1s"
  tags                = var.common_tags
}
