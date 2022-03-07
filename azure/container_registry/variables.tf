variable "name" {
    type    = string
}

variable "location" {
    type    = string
}

variable "resource_group_name" {
    type    = string
}

variable "sku" {
    type    = string
    default = "Standard"
}

variable "tags" {
    type    = map(string)
}

variable "network_rule_bypass_option" {
    type    = string
    default = "AzureServices"
}

variable "admin_enabled" {
    type    = bool
    default = true
}

variable "anonymous_pull_enabled" {
    type    = bool
    default = false
}

variable "data_endpoint_enabled" {
    type    = bool
    default = false
}

variable "public_network_access_enabled" {
    type    = bool
    default = true
}

variable "quarantine_policy_enabled" {
    type    = bool
    default = false
}

variable "zone_redundancy_enabled" {
    type    = bool
    default = false
}
