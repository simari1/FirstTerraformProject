output "name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.securestorage.name
}

output "id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.securestorage.id
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account"
  value       = azurerm_storage_account.securestorage.primary_blob_endpoint
}
