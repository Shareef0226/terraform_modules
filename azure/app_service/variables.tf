variable "name"{
    type = string
}

variable "location"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "app_service_plan_id" {
    type = string
}

variable "app_settings" {
    type = map(string)
}

variable "client_affinity_enabled" {
    type    = bool
    default = false
}

variable "client_cert_enabled" {
    type    = bool
    default = false
}

variable "client_cert_mode" {
    type    = string
    default = null
}

variable "tags" {
    type    = map(string)
}

variable "enabled" {
    type    = bool
    default = true
}

variable "https_only" {
    type    = bool
    default = true
}

variable "identity" {
    type    = object({
        type            = string
        identity_ids    = list(string)
    })
    default = {
        type            = "SystemAssigned"
        identity_ids    = null
    }
}

variable "connection_strings" {
    type    = list(object({
        name    = string
        type    = string
        value   = string
    }))
    default = []
}

variable "auth_settings" {
    type    = object({
        enabled                         = bool
        runtime_version                 = string
        allowed_external_redirect_urls  = bool
        default_provider                = string
        issuer                          = string
        token_refresh_extension_hours   = number
        token_store_enabled             = bool
        unauthenticated_client_action   = string
        active_directory                = object({
            client_id           = string
            client_secret       = string
            allowed_audiences   = list(string)
        })
        additional_login_params         = map(string)
    })
    default = null
}

variable "site_config" {
    type    = object({
        acr_user_managed_identity_client_id  = string
        acr_use_managed_identity_credentials = string
        always_on                            = bool
        linux_fx_version                     = string
        app_command_line                     = string
        default_documents                    = list(string)
        ftps_state                           = string
        http2_enabled                        = bool
        min_tls_version                      = string
        number_of_workers                    = number
        remote_debugging_enabled             = bool
        use_32_bit_worker_process            = bool
        vnet_route_all_enabled               = bool
        websockets_enabled                   = bool

        cors                                 = object({
            allowed_origins                  = list(string)
            support_credentials              = bool
        })

        ip_restriction                       = list(object({
            name                             = string
            priority                         = number
            action                           = string
            ip_address                       = string
            service_tag                      = string
            virtual_network_subnet_id        = string
            headers                          = list(object({
                x_azure_fdid                 = list(string)
                x_fd_health_probe            = list(string)
                x_forwarded_for              = list(string)
                x_forwarded_host             = list(string)
            }))
        }))
    })
    default = {
        acr_user_managed_identity_client_id  = null
        acr_use_managed_identity_credentials = null
        always_on                            = true
        app_command_line                     = null
        default_documents                    = [
            "default.html",
        ]
        ftps_state                           = "Disabled"
        http2_enabled                        = false
        min_tls_version                      = "1.2"
        number_of_workers                    = 1
        remote_debugging_enabled             = false
        use_32_bit_worker_process            = false
        vnet_route_all_enabled               = false
        websockets_enabled                   = false
        cors                                 = {
            allowed_origins                  = ["*"]
            support_credentials              = false
        }
        ip_restriction                       = null
    }
}



