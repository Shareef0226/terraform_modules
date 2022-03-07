resource "azurerm_network_security_group" "current" {
    location                = var.location
    name                    = var.name
    resource_group_name     = var.resource_group_name
    tags                    = merge(var.tags, {ROLE_PURPOSE  = "networkSecurityGroups"})
    security_rule           = var.security_rule
}