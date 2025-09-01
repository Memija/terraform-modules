resource "azurerm_private_endpoint" this {
    name = var.name
    resource_group_name = var.resource_group_name
    location = var.location
    subnet_id = var.subnet_id

    private_service_connection {
        name = var.name
        private_connection_resource_id = var.private_connection_resource_id
        subresource_name = [var.subresource_name]
        is_manual_connection = false
    }

    privtae_dns_zone_group {
        name = var.name
        private_dns_zone_ids = var.private_dns_zone_ids
    }

    tags = var.tags
}