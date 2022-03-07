variable "name" {
    type    = string
}

variable "location" {
    type    = string
}

variable "resource_group_name" {
    type    = string
}

variable "server_version" {
    type    = string
    default = "12.0"
}

variable "connection_policy" {
    type    = string
    default = "Default"
}

variable "minimum_tls_version" {
    type    = string
    default = "1.2"
}

variable "outbound_network_restriction_enabled" {
    type    = bool
    default = false
}

variable "public_network_access_enabled" {
    type    = bool
    default = true
}

variable "administrator_login" {
    type    = string
}

variable "administrator_login_password" {
    type    = string
}

variable "azuread_administrator" {
    type    = object({
        azuread_authentication_only = bool
        login_username              = string
        object_id                   = string
        tenant_id                   = string
    })
}

variable "tags" {
    type = map(string)
}

variable "firewall_rules" {
    type = list(object({
        name                = string
        start_ip_address    = string
        end_ip_address      = string
    }))

    default = []
}

variable "vnet_rules" {
    type = list(object({
        name         = string
        subnet_id    = string
    }))

    default = []
}