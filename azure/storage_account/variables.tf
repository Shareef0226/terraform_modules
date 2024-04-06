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

variable "account_replication_type" {
    type    = string
    default = "RAGRS"
}

variable "account_tier" {
    type    = string
    default = "Standard"
}
