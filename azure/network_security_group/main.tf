resource "azurerm_network_security_group" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }
    location                = var.location
    name                    = var.name
    resource_group_name     = var.resource_group_name
    tags                    = var.tags
    security_rule           = var.security_rule
}