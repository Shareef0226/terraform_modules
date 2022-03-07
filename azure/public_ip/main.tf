resource "azurerm_public_ip" "current" {
    name                           = var.name
    location                       = var.location
    resource_group_name            = var.resource_group_name
    allocation_method              = "Static"
    sku                            = "Standard"
    ip_version                     = "IPv4"
    tags                           = merge(var.tags, {
        ROLE_PURPOSE  = "publicIPAddresses"
    })
}

