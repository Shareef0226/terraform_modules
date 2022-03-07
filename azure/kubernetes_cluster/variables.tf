variable "name" {
    type    = string
}

variable "location" {
    type    = string
}

variable "resource_group_name" {
    type    = string
}

variable "node_resource_group" {
    type    = string
}

variable "dns_prefix" {
    type    = string
}


variable "azure_policy_enabled" {
    type    = bool
}

variable "enable_pod_security_policy" {
    type    = bool
}

variable "http_application_routing_enabled" {
    type    = bool
}

variable "local_account_disabled" {
    type    = bool
}

variable "open_service_mesh_enabled" {
    type    = bool
}

variable "public_network_access_enabled" {
    type    = bool
}

variable "kubernetes_version" {
    type    = string
    default = null
}

variable "sku_tier" {
    type    = string
    default = "Free"
}

variable "role_based_access_control" {
    type    = bool
}

variable "tags" {
    type    = map(string)
}

variable "log_analytics_workspace_id" {
    type    = string
}

variable "service_principal" {
    type    = object({
        client_id       = string
        client_secret   = string
    })
}

variable "default_node_pool" {
    type    = object({
        vm_size                      = string
        availability_zones           = list(string)
        enable_auto_scaling          = bool
        max_pods                     = number
        node_count                   = number
        orchestrator_version         = string
        os_disk_size_gb              = number
        tags                         = map(string)
        ultra_ssd_enabled            = bool
        vnet_subnet_id               = string
    })
}

variable "network_profile" {
    type    = object({
        dns_service_ip          = string
        docker_bridge_cidr      = string
        load_balancer_sku       = string
        network_plugin          = string
        outbound_type           = string
        pod_cidr                = string
        service_cidr            = string
        load_balancer_profile   = object({
            managed_outbound_ip_count = number
            outbound_ports_allocated  = number
        })
    })
}

variable "auto_scaler_profile" {
    type    = object({
        balance_similar_node_groups      = bool
        empty_bulk_delete_max            = string
        expander                         = string
        max_graceful_termination_sec     = string
        max_node_provisioning_time       = string
        max_unready_nodes                = number
        max_unready_percentage           = number
        new_pod_scale_up_delay           = string
        scale_down_delay_after_add       = string
        scale_down_delay_after_delete    = string
        scale_down_delay_after_failure   = string
        scale_down_unneeded              = string
        scale_down_unready               = string
        scale_down_utilization_threshold = string
        scan_interval                    = string
        skip_nodes_with_local_storage    = bool
        skip_nodes_with_system_pods      = bool
    })
}