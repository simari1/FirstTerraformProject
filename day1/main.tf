provider "azurerm" {
  features {}
  subscription_id = "80ca150b-3763-4e87-91f4-b6a3f7db947c"
}

# create a resource group in japan east
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
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

# create a container in the storage account
resource "azurerm_storage_container" "container" {
  name                  = "$web"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}

# Add a index.html file to the storage account
resource "azurerm_storage_blob" "blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<html><head><title>Hello, World from Terraform!</title></head><body><h1>Hello, World from Terraform!</h1></body></html>"
  depends_on             = [azurerm_storage_account_static_website.static_website, azurerm_storage_container.container]
}
