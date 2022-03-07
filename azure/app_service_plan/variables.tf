variable "name"{
    type = string
}

variable "location"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "kind" {
    type = string
}

variable "maximum_elastic_worker_count" {
    type = number
}

variable "app_service_environment_id" {
    type = string
}

variable "per_site_scaling" {
    type = bool
    default = false
}

variable "zone_redundant" {
    type = bool
    default = false
}

variable "sku" {
    type = object({
        capacity    = number
        size        = string
        tier        = string
    })
}

variable "tags" {
    type    = map(string)
}