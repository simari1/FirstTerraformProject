# create a resource group in japan east
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# create a storage account in the resource group
resource "azurerm_storage_account" "sa" {
  count                    = 3
  name                     = "stterraformsimari${count.index}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

output "name" {
  value = azurerm_storage_account.sa[*].name
}
