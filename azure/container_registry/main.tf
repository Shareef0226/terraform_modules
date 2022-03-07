resource "azurerm_container_registry" "current" {
    location                      = var.location
    name                          = var.name
    resource_group_name           = var.resource_group_name
    tags                          = merge(var.tags, {"ROLE_PURPOSE"  = "registries"})
    sku                           = var.sku
    admin_enabled                 = var.admin_enabled
    anonymous_pull_enabled        = var.anonymous_pull_enabled
    data_endpoint_enabled         = var.data_endpoint_enabled
    network_rule_bypass_option    = var.network_rule_bypass_option
    public_network_access_enabled = var.public_network_access_enabled
    quarantine_policy_enabled     = var.quarantine_policy_enabled
    zone_redundancy_enabled       = var.zone_redundancy_enabled

    timeouts {}

}