variable "name"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "namespace_name" {
    type = string
}

variable "partition_count" {
    type    = number
    default = 32
}

variable "message_retention" {
    type    = number
    default = 7
}

variable "status" {
    type    = string
    default = "Active"
}

variable "capture_description" {
    type    = object({
        enabled             = bool
        encoding            = string
        interval_in_seconds = number
        size_limit_in_bytes = number
        skip_empty_archives = bool

        destination         = object({
            name                 = string
            archive_name_format  = string
            blob_container_name  = string
            storage_account_id   = string
        })
    })

    default = null
}