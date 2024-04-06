resource "azurerm_key_vault" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }
    location                        = var.location
    name                            = var.name
    resource_group_name             = var.resource_group_name
    tenant_id                       = var.tenant_id
    sku_name                        = var.sku_name
    enabled_for_disk_encryption     = var.enabled_for_disk_encryption
    purge_protection_enabled        = var.purge_protection_enabled
    soft_delete_retention_days      = var.soft_delete_retention_days

access_policy {
    tenant_id = var.tenant_id
    object_id = var.terraform_identity_object_id

     key_permissions         = [
            "Get",
            "List",
            "Update",
            "Create"
        ]
        secret_permissions      = [
            "Get",
            "Set"
        ]
}
