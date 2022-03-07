resource "azurerm_eventhub_namespace" "current" {
    resource_group_name                 = var.resource_group_name
    name                                = var.name
    location                            = var.location
    sku                                 = var.sku
    capacity                            = var.capacity
    dedicated_cluster_id                = var.dedicated_cluster_id
    zone_redundant                      = var.zone_redundant
    auto_inflate_enabled                = var.auto_inflate_enabled
    maximum_throughput_units            = var.maximum_throughput_units
    tags                                = var.tags   

    identity {
        type = "SystemAssigned"
    }

    dynamic network_rulesets {
        for_each = var.network_rulesets[*]

        content {
            default_action                 = network_rulesets.value.default_action
            trusted_service_access_enabled = network_rulesets.value.trusted_service_access_enabled

            dynamic ip_rule {
                for_each = network_rulesets.value.ip_rule

                content {
                    ip_mask = ip_rule.value.ip_mask
                    action = ip_rule.value.action
                }
            }

            dynamic virtual_network_rule {
                for_each = network_rulesets.value.virtual_network_rule

                content {
                    subnet_id = virtual_network_rule.value.subnet_id
                    ignore_missing_virtual_network_service_endpoint = virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint
                }
            }
        }
    }
}

module "current" {
    count   = length(var.eventhubs)

    source  = "../eventhub"
    resource_group_name                 = var.resource_group_name
    namespace_name                      = azurerm_eventhub_namespace.current.name

    name                                = var.eventhubs[count.index].name
    partition_count                     = var.eventhubs[count.index].partition_count
    message_retention                   = var.eventhubs[count.index].message_retention
    status                              = var.eventhubs[count.index].status
    capture_description                 = var.eventhubs[count.index].capture_description
}