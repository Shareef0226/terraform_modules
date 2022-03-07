module "storage" {
    source              = "../storage_account"
    name                = "${var.name}sa"
    resource_group_name = var.resource_group_name
    location            = var.location
    tags                = merge(var.tags, {"FUNCTION" = var.name} )
}

resource "azurerm_function_app" "current" {
    name                            = var.name
    resource_group_name             = var.resource_group_name
    location                        = var.location
    tags                            = var.tags
    app_service_plan_id             = var.app_service_plan_id
    enabled                         = var.enabled
    os_type                         = var.os_type
    version                         = var.os_type == "Linux" || var.os_type == "linux" ? "~3" : var.function_version
    https_only                      = var.https_only
    enable_builtin_logging          = var.enable_builtin_logging

    storage_account_name            = "${var.name}sa"
    storage_account_access_key      = module.storage.primary_access_key

    auth_settings {
        enabled = var.auth_settings.enabled
    }

    identity {
        type            = var.identity.type
        identity_ids    = var.identity.identity_ids
    }

    site_config {
        always_on                        = var.site_config.always_on
        dotnet_framework_version         = var.site_config.dotnet_framework_version
        ftps_state                       = var.site_config.ftps_state
        http2_enabled                    = var.site_config.http2_enabled
        linux_fx_version                 = var.site_config.linux_fx_version
        min_tls_version                  = "1.2"
        use_32_bit_worker_process        = var.site_config.use_32_bit_worker_process
        vnet_route_all_enabled           = var.site_config.vnet_route_all_enabled
        websockets_enabled               = var.site_config.websockets_enabled

        cors {
            support_credentials         = var.site_config.cors.support_credentials
            allowed_origins             = var.site_config.cors.allowed_origins
        }
    }
}