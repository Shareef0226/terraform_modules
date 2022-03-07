output "id" {
  value = azurerm_app_service.current.id
}

output "custom_domain_verification_id" {
  value = azurerm_app_service.current.custom_domain_verification_id
}

output "default_site_hostname" {
  value = azurerm_app_service.current.default_site_hostname
}

output "outbound_ip_addresses" {
  value = azurerm_app_service.current.outbound_ip_addresses
}

output "outbound_ip_address_list" {
  value = azurerm_app_service.current.outbound_ip_address_list
}

output "possible_outbound_ip_addresses" {
  value = azurerm_app_service.current.possible_outbound_ip_addresses
}

output "possible_outbound_ip_address_list" {
  value = azurerm_app_service.current.possible_outbound_ip_address_list
}

output "site_credential" {
  value = azurerm_app_service.current.site_credential
}

output "identity" {
  value = azurerm_app_service.current.identity
}