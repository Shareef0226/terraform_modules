output "id" {
    value   = azurerm_function_app.current.id
}

output "default_hostname" {
    value   = azurerm_function_app.current.default_hostname
}

output "identity" {
    value   = azurerm_function_app.current.identity
}

output "outbound_ip_addresses" {
    value   = azurerm_function_app.current.outbound_ip_addresses
}


output "possible_outbound_ip_addresses" {
    value   = azurerm_function_app.current.possible_outbound_ip_addresses
}

output "site_credential" {
    value   = azurerm_function_app.current.site_credential
}