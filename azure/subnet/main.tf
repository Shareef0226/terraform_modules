resource "azurerm_subnet" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
            delegation[*].service_delegation.actions
        ]
    }
    name                                            = var.name
    resource_group_name                             = var.resource_group_name
    virtual_network_name                            = var.virtual_network_name
    address_prefixes                                = var.address_prefixes
    enforce_private_link_endpoint_network_policies  = var.enforce_private_link_endpoint_network_policies
    enforce_private_link_service_network_policies   = var.enforce_private_link_service_network_policies
    service_endpoints                               = var.service_endpoints

    dynamic "delegation" {
        for_each = var.service_delegation == "Databricks" ? [1] : []
        
        content {
            name = "delegation"

            service_delegation {
                name    = "Microsoft.Databricks/workspaces"
                actions = [
                    "Microsoft.Network/virtualNetworks/subnets/join/action",
                    "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                    "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                ]
            }        
        }
    }
}