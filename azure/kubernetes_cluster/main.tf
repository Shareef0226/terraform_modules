resource "azurerm_kubernetes_cluster" "current" {
    location                         = var.location
    name                             = var.name
    resource_group_name              = var.resource_group_name
    node_resource_group              = var.node_resource_group

    dns_prefix                       = var.dns_prefix
    azure_policy_enabled             = var.azure_policy_enabled
    enable_pod_security_policy       = var.enable_pod_security_policy
    http_application_routing_enabled = var.http_application_routing_enabled
    kubernetes_version               = var.kubernetes_version
    local_account_disabled           = var.local_account_disabled
    open_service_mesh_enabled        = var.open_service_mesh_enabled
    public_network_access_enabled    = var.public_network_access_enabled
    sku_tier                         = var.sku_tier
    tags                             = merge(var.tags, { ROLE_PURPOSE  = "ManagedClusters" })

    default_node_pool {
        name                         = "aksnodepool"
        vm_size                      = var.default_node_pool.vm_size
        availability_zones           = var.default_node_pool.availability_zones
        enable_auto_scaling          = var.default_node_pool.enable_auto_scaling
        enable_host_encryption       = false
        enable_node_public_ip        = false
        fips_enabled                 = false
        max_pods                     = var.default_node_pool.max_pods
        node_count                   = var.default_node_pool.node_count
        only_critical_addons_enabled = false
        orchestrator_version         = var.default_node_pool.orchestrator_version
        os_disk_size_gb              = var.default_node_pool.os_disk_size_gb
        os_disk_type                 = "Managed"
        tags                         = var.default_node_pool.tags
        type                         = "VirtualMachineScaleSets"
        ultra_ssd_enabled            = var.default_node_pool.ultra_ssd_enabled
        vnet_subnet_id               = var.default_node_pool.vnet_subnet_id
    }

    auto_scaler_profile {
        balance_similar_node_groups      = var.auto_scaler_profile.balance_similar_node_groups
        empty_bulk_delete_max            = var.auto_scaler_profile.empty_bulk_delete_max
        expander                         = var.auto_scaler_profile.expander
        max_graceful_termination_sec     = var.auto_scaler_profile.max_graceful_termination_sec
        max_node_provisioning_time       = var.auto_scaler_profile.max_node_provisioning_time
        max_unready_nodes                = var.auto_scaler_profile.max_unready_nodes
        max_unready_percentage           = var.auto_scaler_profile.max_unready_percentage
        new_pod_scale_up_delay           = var.auto_scaler_profile.new_pod_scale_up_delay
        scale_down_delay_after_add       = var.auto_scaler_profile.scale_down_delay_after_add
        scale_down_delay_after_delete    = var.auto_scaler_profile.scale_down_delay_after_delete
        scale_down_delay_after_failure   = var.auto_scaler_profile.scale_down_delay_after_failure
        scale_down_unneeded              = var.auto_scaler_profile.scale_down_unneeded
        scale_down_unready               = var.auto_scaler_profile.scale_down_unready
        scale_down_utilization_threshold = var.auto_scaler_profile.scale_down_utilization_threshold
        scan_interval                    = var.auto_scaler_profile.scan_interval
        skip_nodes_with_local_storage    = var.auto_scaler_profile.skip_nodes_with_local_storage
        skip_nodes_with_system_pods      = var.auto_scaler_profile.skip_nodes_with_system_pods
    }


    network_profile {
        dns_service_ip                  = var.network_profile.dns_service_ip
        docker_bridge_cidr              = var.network_profile.docker_bridge_cidr
        load_balancer_sku               = var.network_profile.load_balancer_sku
        network_plugin                  = var.network_profile.network_plugin
        outbound_type                   = var.network_profile.outbound_type
        pod_cidr                        = var.network_profile.pod_cidr
        service_cidr                    = var.network_profile.service_cidr

        load_balancer_profile {
            managed_outbound_ip_count   = var.network_profile.load_balancer_profile.managed_outbound_ip_count
            outbound_ports_allocated    = var.network_profile.load_balancer_profile.outbound_ports_allocated
        }
    }

    oms_agent {
        log_analytics_workspace_id = var.log_analytics_workspace_id
    }

    role_based_access_control {
        enabled = var.role_based_access_control
    }

    service_principal {
        client_id = var.service_principal.client_id
        client_secret = var.service_principal.client_secret
    }

    timeouts {}

}