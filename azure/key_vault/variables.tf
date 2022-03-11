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

variable "enable_rbac_authorization" {
  type    = bool
  default = false
}

variable "enabled_for_deployment" {
  type    = bool
  default = true
}

variable "enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "enabled_for_template_deployment" {
  type    = bool
  default = true
}

variable "purge_protection_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type = map(string)
}

variable "soft_delete_retention_days" {
  type = number
  default = 90
}

variable "terraform_identity_object_id" {
  type    = string
}

variable "network_acls" {
  type = object({
    bypass                      = string
    default_action              = string
    ip_rules                    = string
    virtual_network_subnet_ids  = string
  })
}