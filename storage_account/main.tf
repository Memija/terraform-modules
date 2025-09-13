resource "azurerm_storage_account" "this" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = var.account_replication_type
  public_network_access_enabled = var.public_network_access_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  shared_access_key_enabled = var.shared_access_key_enabled

  blob_properties {
    delete_retention_policy {
      days = local.retention_in_days
    }
    container_delete_retention_policy {
      days = local.retention_in_days
    }
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      var.user_assigned_identity_id
    ]
  }

  customer_managed_key {
    key_vault_key_id = var.key_vault_key_id
    user_assigned_identity_id = var.user_assigned_identity_id
  }

  tags = var.tags
}
