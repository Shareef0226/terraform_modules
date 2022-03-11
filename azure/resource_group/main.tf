resource "azurerm_resource_group" "current"{
    lifecycle {
          ignore_changes           = [ 
              tags, 
          ]
    }
    name            = var.name
    location        = var.location
    tags            = var.tags
}