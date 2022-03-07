locals {
    admin_policies = {
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
        ],
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
        ]
        secret_permissions      = [
            "Get",
            "List",
            "Set",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
        ]
        storage_permissions     = []
    }
}
resource "azurerm_key_vault" "current" {
    location                        = var.location
    name                            = var.name
    resource_group_name             = var.resource_group_name
    tenant_id                       = var.tenant_id
    sku_name                        = "premium"
    enable_rbac_authorization       = false
    enabled_for_deployment          = true
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = true
    purge_protection_enabled        = true
    soft_delete_retention_days      = var.soft_delete_retention_days
    tags                            = merge(var.tags, {
        ROLE_PURPOSE  = "vaults"
    })
    network_acls {
        bypass                     = "AzureServices"
        default_action             = "Allow"
        ip_rules                   = []
        virtual_network_subnet_ids = []
    }

    timeouts {}
}

resource "azurerm_key_vault_access_policy" "admins" {
    count = length(var.admins)

    key_vault_id = azurerm_key_vault.current.id
    tenant_id    = var.tenant_id
  
    application_id = var.admins[count.index].application_id 
    object_id = var.admins[count.index].object_id

    certificate_permissions = local.admin_policies.certificate_permissions
    key_permissions = local.admin_policies.key_permissions
    secret_permissions = local.admin_policies.secret_permissions
    storage_permissions = local.admin_policies.storage_permissions
}