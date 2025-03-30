#############################################################################
# TERRAFORM CONFIG
#############################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.19.0"
    }
  }
}

#############################################################################
# VARIABLES
#############################################################################

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}


variable "vnet_cidr_range" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "database"]
}

#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

#############################################################################
# RESOURCES
#############################################################################

# data "azurerm_resource_group" "vnet_main" {
# }


# resource "azurerm_resource_group" "vnet_main" {
#   name     = var.resource_group_name
#   location = var.location
# }

# data "azurerm_resource_group" "vnet_main" {
#     name     = data.azurerm_resource_group.vnet_main.resource_group_name
#     location = data.azurerm_resource_group.vnet_main.location
# }

# https://registry.terraform.io/modules/Azure/avm-res-network-virtualnetwork/azurerm/latest
# module "vnet-main" {
#   source              = "Azure/avm-res-network-virtualnetwork/azurerm"
#   version             = "~> 0.8.1"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.vnet_main.name
#   name                = var.resource_group_name
#   address_space       = [var.vnet_cidr_range]
#   subnets = {
#     subnet1 = {
#       name           = var.subnet_names[0]
#       address_prefix = var.subnet_prefixes[0]
#       security_group = null
#     },
#     subnet2 = {
#       name           = var.subnet_names[1]
#       address_prefix = var.subnet_prefixes[1]
#       security_group = null
#     }
#   }

#   tags = {
#     environment = "dev"
#     costcenter  = "it"

#   }

#   depends_on = [azurerm_resource_group.vnet_main]
# }

#############################################################################
# OUTPUTS
#############################################################################
# # get vnet id as output
# output "vnet_id" {
#   value = module.vnet-main.resource_id
# }
