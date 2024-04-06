resource "azurerm_container_registry" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }
    location                      = var.location
    name                          = var.name
    resource_group_name           = var.resource_group_name
    tags                          = var.tags
    sku                           = var.sku
    admin_enabled                 = var.admin_enabled
    zone_redundancy_enabled       = var.zone_redundancy_enabled
}
