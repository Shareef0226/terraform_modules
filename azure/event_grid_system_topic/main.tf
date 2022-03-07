resource "azurerm_eventgrid_system_topic" "current" {
    location               = var.location
    name                   = var.name
    resource_group_name    = var.resource_group_name
    source_arm_resource_id = var.source_arm_resource_id
    tags                   = var.tags
    topic_type             = var.topic_type
}