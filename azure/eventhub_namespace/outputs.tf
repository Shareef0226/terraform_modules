output "id" {
    value = azurerm_eventhub_namespace.current.id
}

output "identity" {
    value = azurerm_eventhub_namespace.current.identity
}

output "default_primary_connection_string" {
    value = azurerm_eventhub_namespace.current.default_primary_connection_string
}

output "default_primary_connection_string_alias" {
    value = azurerm_eventhub_namespace.current.default_primary_connection_string_alias
}

output "default_primary_key" {
    value = azurerm_eventhub_namespace.current.default_primary_key
}

output "default_secondary_connection_string" {
    value = azurerm_eventhub_namespace.current.default_secondary_connection_string
}

output "default_secondary_connection_string_alias" {
    value = azurerm_eventhub_namespace.current.default_secondary_connection_string_alias
}

output "default_secondary_key" {
    value = azurerm_eventhub_namespace.current.default_secondary_key
}
