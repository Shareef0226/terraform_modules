variable "name"{
    type    = string
}

variable "location"{
    type    = string
}

variable "resource_group_name" {
    type    = string
}

variable "app_service_plan_id" {
    type    = string
}

variable "tags" {
    type    = map(string)
}

variable "os_type" {
    type    = string
}

variable "function_version" {
    type    = string
    default = "~1"
}

variable "enabled" {
    type    = bool
    default = true
}

variable "https_only" {
    type    = bool
    default = true
}

variable "enable_builtin_logging" {
    type    = bool
    default = true
}

variable "auth_settings" {
    type    = object({
        enabled     = bool
    })
    default = {
        enabled     = false
    }
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

variable "site_config" {
    type    = object({
        always_on                        = bool
        dotnet_framework_version         = string
        ftps_state                       = string
        http2_enabled                    = bool
        linux_fx_version                 = string
        use_32_bit_worker_process        = bool
        vnet_route_all_enabled           = bool
        websockets_enabled               = bool
        cors                             = object({
            support_credentials          = bool
            allowed_origins              = list(string)
        })
    })
}

