output "id" {
    value = azurerm_databricks_workspace.current.id
}

output "managed_resource_group_id" {
    value = azurerm_databricks_workspace.current.managed_resource_group_id
}

output "workspace_url" {
    value = azurerm_databricks_workspace.current.workspace_url
}

output "workspace_id" {
    value = azurerm_databricks_workspace.current.workspace_id
}

output "storage_account_identity" {
    value = azurerm_databricks_workspace.current.storage_account_identity
}