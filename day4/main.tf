terraform {
  # use azurerm provider version 3.0.0 or later
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup1"
  location = "Japan East"
}

# use module to cretate secure storage account
module "samplemodule" {
  source              = "./Modules/securestorage"
  resource_group_name = azurerm_resource_group.rg.name
  name                = "simastorageaccount1"
  location            = "Japan East"
  environment         = "dev"
}


output "name" {
  description = "The name of the storage account"
  value       = module.samplemodule.name
}
