resource "azurerm_eventhub" "current" {
    resource_group_name                 = var.resource_group_name
    name                                = var.name
    namespace_name                      = var.namespace_name
    partition_count                     = var.partition_count
    message_retention                   = var.message_retention
    status                              = var.status

    dynamic capture_description {
        for_each = var.capture_description[*]

        content {
            enabled             = capture_description.value.enabled
            encoding            = capture_description.value.encoding
            interval_in_seconds = capture_description.value.interval_in_seconds
            size_limit_in_bytes = capture_description.value.size_limit_in_bytes
            skip_empty_archives = capture_description.value.skip_empty_archives

            destination {
                name                = capture_description.value.destination.name
                archive_name_format = capture_description.value.destination.archive_name_format
                blob_container_name = capture_description.value.destination.blob_container_name
                storage_account_id  = capture_description.value.destination.storage_account_id
            }
        }
    }
}