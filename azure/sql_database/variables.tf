variable "name" {
    type    = string
}

variable "server_id" {
    type    = string
}

variable "elastic_pool_id" {
    type    = string
    default = null
}

variable "sku_name" {
    type    = string
}

variable "license_type" {
    type    = string
    default = "BasePrice"
}

variable "max_size_gb" {
    type    = number
}

variable "min_capacity" {
    type    = number
    default = 0
}

variable "read_replica_count" {
    type    = number
    default = 0
}

variable "read_scale" {
    type    = bool
    default = false
}

variable "storage_account_type" {
    type    = string
    default = "GRS"
}

variable "zone_redundant" {
    type    = bool
    default = false
}

variable "tags" {
    type = map(string)
}
