variable "name"{
    type = string
}

variable "location"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "sku" {
    type = string
}

variable "managed_resource_group_name" {
    type = string
}

variable "customer_managed_key_enabled" {
    type    = bool
    default = false
}

variable "infrastructure_encryption_enabled" {
    type    = bool
    default = false
}

variable "public_network_access_enabled" {
    type    = bool
    default = true
}

variable "tags" {
    type    = map(string)
}

variable "no_public_ip" {
    type    = bool
    default = false
}

variable "virtual_network_id" {
    type    = string
}

variable "private_subnet_name" {
    type    = string
}

variable "private_subnet_network_security_group_association_id" {
    type    = string
}

variable "public_subnet_name" {
    type    = string
}

variable "public_subnet_network_security_group_association_id" {
    type    = string
}

variable "storage_account_name" {
    type    = string
}

variable "storage_account_sku_name" {
    type    = string
}


