terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name           = var.resource_group_name
  name                          = var.name
  account_kind                  = "StorageV2"
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = var.environment == "prod" ? "LRS" : "GRS"
  public_network_access_enabled = false
  tags                          = local.tags
}
