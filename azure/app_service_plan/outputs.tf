output "id" {
  value = azurerm_app_service_plan.current.id
}

output "maximum_number_of_workers" {
  value = azurerm_app_service_plan.current.maximum_number_of_workers
}

output "object" {
  value = azurerm_app_service_plan.current
}