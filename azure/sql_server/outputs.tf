output "id" {
    value = azurerm_mssql_server.current.id
}

output "fully_qualified_domain_name" {
    value = azurerm_mssql_server.current.fully_qualified_domain_name
}

output "restorable_dropped_database_ids" {
    value = azurerm_mssql_server.current.restorable_dropped_database_ids
}