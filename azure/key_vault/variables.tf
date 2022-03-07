variable "name"{
  type = string
}

variable "location"{
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "soft_delete_retention_days" {
  type = number
  default = 90
}

variable "admins" {
  type = list(object({
    application_id  = string
    object_id       = string
  }))
}