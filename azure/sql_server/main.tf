resource "azurerm_mssql_server" "current" {
    location                             = var.location
    name                                 = var.name
    resource_group_name                  = var.resource_group_name
    version                              = var.server_version
    connection_policy                    = var.connection_policy
    minimum_tls_version                  = var.minimum_tls_version
    outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
    public_network_access_enabled        = var.public_network_access_enabled
    tags                                 = var.tags

    administrator_login                  = var.administrator_login
    administrator_login_password         = var.administrator_login_password

    azuread_administrator {
        azuread_authentication_only     = var.azuread_administrator.azuread_authentication_only
        login_username                  = var.azuread_administrator.login_username
        object_id                       = var.azuread_administrator.object_id
        tenant_id                       = var.azuread_administrator.tenant_id
    }
}

resource "azurerm_mssql_firewall_rule" "current" {
    count = length(var.firewall_rules)

    server_id           = azurerm_mssql_server.current.id
    name                = var.firewall_rules[count.index].name
    start_ip_address    = var.firewall_rules[count.index].start_ip_address
    end_ip_address      = var.firewall_rules[count.index].end_ip_address
}

resource "azurerm_mssql_virtual_network_rule" "current" {
    count = length(var.vnet_rules)

    server_id                               = azurerm_mssql_server.current.id
    name                                    = var.vnet_rules[count.index].name
    subnet_id                               = var.vnet_rules[count.index].subnet_id
    ignore_missing_vnet_service_endpoint    = true
}