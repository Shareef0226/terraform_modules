resource "azurerm_mssql_database" "current" {
    name                        = var.name
    server_id                   = var.server_id
    elastic_pool_id             = var.elastic_pool_id
    collation                   = "SQL_Latin1_General_CP1_CI_AS"
    sku_name                    = var.sku_name
    license_type                = var.license_type
    max_size_gb                 = var.max_size_gb
    min_capacity                = var.min_capacity
    read_replica_count          = var.read_replica_count
    read_scale                  = var.read_scale
    storage_account_type        = var.storage_account_type
    zone_redundant              = var.zone_redundant
    tags                        = merge(var.tags, {
        ROLE_PURPOSE  = "databases"
    })
}