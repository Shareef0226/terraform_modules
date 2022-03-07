variable "name"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "tags" {
    type = map(string)
}

variable "access_tier" {
    type    = string
    default = "Hot"
}

variable "account_kind" {
    type    = string
    default = "StorageV2"
}

variable "account_replication_type" {
    type    = string
    default = "RAGRS"
}

variable "account_tier" {
    type    = string
    default = "Standard"
}

variable "infrastructure_encryption_enabled" {
    type    = bool
    default = false
}

variable "is_hns_enabled" {
    type    = bool
    default = true
}

variable "nfsv3_enabled" {
    type    = bool
    default = false
}

variable "shared_access_key_enabled" {
    type    = bool
    default = true
}

variable "queue_encryption_key_type" {
    type    = string
    default = "Service"
}

variable "table_encryption_key_type" {
    type    = string
    default = "Service"
}

variable "blob_properties" {
    type    = map(bool)
    default = {
        change_feed_enabled      = false
        last_access_time_enabled = false
        versioning_enabled       = false 
    }
}

variable "network_rules" {
    type = object({
        bypass                     = list(string)
        default_action             = string
        ip_rules                   = list(string)
        virtual_network_subnet_ids = list(string)
    })
    default = {
        bypass                     = ["Logging", "Metrics", "AzureServices"]
        default_action             = "Allow"
        ip_rules                   = []
        virtual_network_subnet_ids = []
    }
}

variable "containers" {
    type = list(string)
    default = []
}