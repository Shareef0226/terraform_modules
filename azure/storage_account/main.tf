resource "azurerm_storage_account" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }
    name                              = var.name
    resource_group_name               = var.resource_group_name
    location                          = var.location
    account_replication_type          = var.account_replication_type
    account_tier                      = var.account_tier
    tags                              = var.tags
}
