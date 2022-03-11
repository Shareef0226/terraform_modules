resource "azurerm_databricks_workspace" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }
    name                                = var.name
    resource_group_name                 = var.resource_group_name
    location                            = var.location
    sku                                 = var.sku
    managed_resource_group_name         = var.managed_resource_group_name
    tags                                = var.tags
    customer_managed_key_enabled        = var.customer_managed_key_enabled
    infrastructure_encryption_enabled   = var.infrastructure_encryption_enabled
    public_network_access_enabled       = var.public_network_access_enabled

    custom_parameters {
        no_public_ip                                            = var.no_public_ip
        virtual_network_id                                      = var.virtual_network_id
        private_subnet_name                                     = var.private_subnet_name
        private_subnet_network_security_group_association_id    = var.private_subnet_network_security_group_association_id
        public_subnet_name                                      = var.public_subnet_name
        public_subnet_network_security_group_association_id     = var.public_subnet_network_security_group_association_id
        storage_account_name                                    = var.storage_account_name
        storage_account_sku_name                                = var.storage_account_sku_name
    }
}

