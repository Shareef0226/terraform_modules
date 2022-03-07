output "id" {
    value = azurerm_container_registry.current.id
}

output "login_server" {
    value = azurerm_container_registry.current.login_server
}

output "admin_username" {
    value = azurerm_container_registry.current.admin_username
}

output "admin_password" {
    value = azurerm_container_registry.current.admin_password
}

output "identity" {
    value = azurerm_container_registry.current.identity
}