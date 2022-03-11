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
    enable_rbac_authorization       = var.enable_rbac_authorization
    enabled_for_deployment          = var.enabled_for_deployment
    enabled_for_disk_encryption     = var.enabled_for_disk_encryption
    enabled_for_template_deployment = var.enabled_for_template_deployment
    purge_protection_enabled        = var.purge_protection_enabled
    soft_delete_retention_days      = var.soft_delete_retention_days
    tags                            = var.tags
    
    network_acls {
        bypass                     = var.network_acls.bypass
        default_action             = var.network_acls.default_action
        ip_rules                   = var.network_acls.ip_rules
        virtual_network_subnet_ids = var.network_acls.virtual_network_subnet_ids
    }
}

resource "azurerm_key_vault_access_policy" "current" {
    key_vault_id = azurerm_key_vault.current.id
    tenant_id    = var.tenant_id
  
    application_id = null
    object_id = var.terraform_identity_object_id

    certificate_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "ManageContacts",
            "ManageIssuers",
            "GetIssuers",
            "ListIssuers",
            "SetIssuers",
            "DeleteIssuers",
            "Purge"
        ]
        key_permissions         = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "Sign",
            "Verify",
            "Encrypt",
            "Decrypt",
            "WrapKey",
            "UnwrapKey",
            "Purge"
        ]
        secret_permissions      = [
            "Get",
            "List",
            "Set",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "Purge"
        ]
        storage_permissions     = [
            "Get",
            "GetSAS",
            "List",
            "ListSAS",
            "Set",
            "SetSAS",
            "Delete",
            "DeleteSAS",
            "Update",
            "RegenerateKey",
            "Recover",
            "Backup",
            "Restore",
            "Purge"
        ]
}