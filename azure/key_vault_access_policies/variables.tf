variable "tenant_id" {
    type = string
}

variable "key_vault_id" {
    type    = string
}

variable "access_policy" {
    type = list(object({
        application_id          = string
        object_id               = string
        certificate_permissions = list(string)
        key_permissions         = list(string)
        secret_permissions      = list(string)
        storage_permissions     = list(string)
    }))
}