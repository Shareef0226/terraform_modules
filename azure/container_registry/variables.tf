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

variable "admin_enabled" {
    type    = bool
    default = true
}

variable "zone_redundancy_enabled" {
    type    = bool
    default = false
}
