output "id" {
  value = azurerm_storage_account.current.id
}

output "primary_location" {
  value = azurerm_storage_account.current.primary_location
}

output "primary_access_key" {
  value = azurerm_storage_account.current.primary_access_key
}

output "secondary_location" {
  value = azurerm_storage_account.current.secondary_location
}

output "secondary_access_key" {
  value = azurerm_storage_account.current.secondary_access_key
}

output "identity" {
  value = azurerm_storage_account.current.identity 
}

output "object" {
  value = azurerm_storage_account.current
}