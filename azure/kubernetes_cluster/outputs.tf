output "id" {
    value = azurerm_kubernetes_cluster.current.id
}

output "fqdn" {
    value = azurerm_kubernetes_cluster.current.fqdn
}

output "private_fqdn" {
    value = azurerm_kubernetes_cluster.current.private_fqdn
}

output "portal_fqdn" {
    value = azurerm_kubernetes_cluster.current.portal_fqdn
}

output "kube_admin_config" {
    value = azurerm_kubernetes_cluster.current.kube_admin_config
}

output "kube_admin_config_raw" {
    value = azurerm_kubernetes_cluster.current.kube_admin_config_raw
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.current.kube_config
}

output "kube_config_raw" {
    value = azurerm_kubernetes_cluster.current.kube_config_raw
}

output "http_application_routing_zone_name" {
    value = azurerm_kubernetes_cluster.current.id
}

output "http_application_routing" {
    value = azurerm_kubernetes_cluster.current.id
}

output "node_resource_group" {
    value = azurerm_kubernetes_cluster.current.id
}

output "addon_profile" {
    value = azurerm_kubernetes_cluster.current.id
}

output "identity" {
    value = azurerm_kubernetes_cluster.current.identity
}

output "oms_agent" {
    value = azurerm_kubernetes_cluster.current.oms_agent
}

output "key_vault_secrets_provider" {
    value = azurerm_kubernetes_cluster.current.key_vault_secrets_provider
}