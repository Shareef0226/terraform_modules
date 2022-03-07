variable "name"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "sku" {
    type = string
}

variable "capacity" {
    type = string
}

variable "tags" {
    type = map(string)
}

variable "auto_inflate_enabled" {
    type = bool
}

variable "dedicated_cluster_id" {
    type    = string
    default = null
}

variable "maximum_throughput_units" {
    type    = number
    default = null
}

variable "zone_redundant" {
    type    = bool
    default = false
}   

variable "network_rulesets" {
    type    = object({
        default_action                 = string
        trusted_service_access_enabled = bool
        ip_rule                        = list(object({
            ip_mask                    = string
            action                     = string
        }))
        virtual_network_rule           = list(object({
            subnet_id                                       = string
            ignore_missing_virtual_network_service_endpoint = bool
        }))
    })

    default = null
}

variable "eventhubs" {
    type    = list(object({
        name                         = string
        partition_count              = number
        message_retention            = number
        status                       = string

        capture_description          = object({
            enabled                  = bool
            encoding                 = string
            interval_in_seconds      = number
            size_limit_in_bytes      = number
            skip_empty_archives      = bool

            destination              = object({
                name                 = string
                archive_name_format  = string
                blob_container_name  = string
                storage_account_id   = string
            })
        })
    }))
}