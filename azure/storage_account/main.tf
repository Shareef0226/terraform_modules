resource "azurerm_storage_account" "current" {
    name                              = var.name
    resource_group_name               = var.resource_group_name
    location                          = var.location
    access_tier                       = var.access_tier
    account_kind                      = var.account_kind
    account_replication_type          = var.account_replication_type
    account_tier                      = var.account_tier
    allow_blob_public_access          = false
    enable_https_traffic_only         = true
    infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
    is_hns_enabled                    = var.is_hns_enabled
    min_tls_version                   = "TLS1_2"
    nfsv3_enabled                     = var.nfsv3_enabled
    queue_encryption_key_type         = var.queue_encryption_key_type
    shared_access_key_enabled         = var.shared_access_key_enabled
    table_encryption_key_type         = var.table_encryption_key_type
    tags                              = merge(var.tags, {
        ROLE_PURPOSE  = "storageAccounts"
    })

    blob_properties {
        change_feed_enabled      = var.blob_properties.change_feed_enabled
        last_access_time_enabled = var.blob_properties.last_access_time_enabled
        versioning_enabled       = var.blob_properties.versioning_enabled 
    }

    network_rules {
        bypass                     = var.network_rules.bypass
        default_action             = var.network_rules.default_action
        ip_rules                   = var.network_rules.ip_rules
        virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
    }
}

resource "azurerm_storage_container" "current" {
  count                 = length(var.containers)
  name                  = var.containers[count.index]
  storage_account_name  = azurerm_storage_account.current.name
  container_access_type = "private"
}