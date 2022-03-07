resource "azurerm_app_service" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
            app_settings
        ]
    }
    app_service_plan_id               = var.app_service_plan_id
    location                          = var.location
    name                              = var.name
    resource_group_name               = var.resource_group_name
    app_settings                      = var.app_settings
    client_affinity_enabled           = var.client_affinity_enabled
    client_cert_enabled               = var.client_cert_enabled
    client_cert_mode                  = var.client_cert_mode
    enabled                           = var.enabled
    https_only                        = var.https_only
    tags                              = merge(var.tags, {"ROLE_PURPOSE"  = "sites"})

    dynamic auth_settings {
        for_each = var.auth_settings[*]

        content {
            additional_login_params        = var.auth_settings.additional_login_params
            enabled                        = var.auth_settings.enabled
            runtime_version                = var.auth_settings.runtime_version
            token_refresh_extension_hours  = var.auth_settings.token_refresh_extension_hours
            token_store_enabled            = var.auth_settings.token_store_enabled
            unauthenticated_client_action  = var.auth_settings.unauthenticated_client_action

            dynamic active_directory {
                for_each = var.auth_settings.active_directory[*]

                content {
                    client_id           = var.auth_settings.active_directory.client_id
                    client_secret       = var.auth_settings.active_directory.client_secret
                    allowed_audiences   = var.auth_settings.active_directory.allowed_audiences
                }

            }
        }

    }

    dynamic connection_string {
        for_each = var.connection_strings

        content {
            name  = connection_string.value.name
            type  = connection_string.value.type
            value = connection_string.value.value
        }
    }

    identity {
        type         = var.identity.type
        identity_ids = var.identity.identity_ids
    }

    site_config {
        acr_user_managed_identity_client_id  = var.site_config.acr_user_managed_identity_client_id
        acr_use_managed_identity_credentials = var.site_config.acr_use_managed_identity_credentials
        always_on                            = var.site_config.always_on
        app_command_line                     = var.site_config.app_command_line
        linux_fx_version                     = var.site_config.linux_fx_version
        default_documents                    = var.site_config.default_documents
        ftps_state                           = var.site_config.ftps_state
        http2_enabled                        = var.site_config.http2_enabled
        ip_restriction                       = var.site_config.ip_restriction
        min_tls_version                      = var.site_config.min_tls_version
        number_of_workers                    = var.site_config.number_of_workers
        remote_debugging_enabled             = var.site_config.remote_debugging_enabled
        vnet_route_all_enabled               = var.site_config.vnet_route_all_enabled
        websockets_enabled                   = var.site_config.websockets_enabled

        cors {
            allowed_origins     = var.site_config.cors.allowed_origins
            support_credentials = var.site_config.cors.support_credentials
        }
    }

    timeouts {}

}