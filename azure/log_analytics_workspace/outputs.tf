output "id" {
  value = azurerm_log_analytics_workspace.current.id
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.current.workspace_id
}

output "primary_shared_key" {
  value = azurerm_log_analytics_workspace.current.primary_shared_key
}

output "secondary_shared_key" {
  value = azurerm_log_analytics_workspace.current.secondary_shared_key
}


output "object" {
  value = azurerm_log_analytics_workspace.current
}