provider "azurerm" {
  features {}
  subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

# create a resource group in japan east
resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-simari"
  location = "Japan East"
}

# create a storage account in the resource group
resource "azurerm_storage_account" "sa" {
  name                     = "stterraformsimari"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.sa.id
  index_document     = "index.html"
}

# Add a index.html file to the storage account
resource "azurerm_storage_blob" "blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<html><head><title>Hello, World from Terraform!</title></head><body><h1>Hello, World from TErraform!</h1></body></html>"
}
