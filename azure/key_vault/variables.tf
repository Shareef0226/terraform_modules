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

variable "sku_name" {
  type = string
}

variable "enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "purge_protection_enabled" {
  type    = bool
  default = true
}

variable "soft_delete_retention_days" {
  type = number
  default = 90
}

variable "terraform_identity_object_id" {
  type    = string
}
