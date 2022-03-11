resource "azurerm_virtual_network" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }    
    name                            = var.name
    location                        = var.location
    resource_group_name             = var.resource_group_name
    address_space                   = var.address_space
    dns_servers                     = var.dns_servers
    tags                            = var.tags
}