variable "name" {
  description = "The name of the storage account"
  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 24 && can(regex("^[a-z0-9]+$", var.name))
    error_message = "The storage account name must be between 3 and 24 characters in length and can contain only lowercase letters and numbers."
  }
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string 
}

variable "location" {
  description = "The Azure region where the storage account will be created"
    validation {
    condition     = length(var.location) <= 90 && length(var.location) >= 1
    error_message = "The location must be between 1 and 90 characters long."
  }
  type = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account."
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = <<EOT
      account_replication_type value must be one of the following:
        - LRS
        - GRS
        - RAGRS
        - ZRS
        - GZRS
        - RAGZRS
      EOT
  }
  type = string
}

variable "public_network_access_enabled" {
  description = "Indicates whether public network access is enabled for the storage account"
  default = false
  type = bool
}

variable "allow_nested_items_to_be_public" {
  description = "Indicates whether nested items within the storage account can be made public"
  default = false
  type = bool
}

variable "shared_access_key_enabled" {
  description = "Specifies whether the storage account should have shared access keys enabled"
  default = true
  type = bool
}

variable "user_assigned_identity_id" {
  description = "The ID of the user assigned identity to be associated with the storage account"
  validation {
    condition     = length(var.user_assigned_identity_id) > 0
    error_message = "User assigned identity ID must not be empty"
  }
  type = string
}

variable "key_vault_key_id" {
  description = "The Key Vault key ID to be used for customer-managed keys"
  validation {
    condition     = length(var.key_vault_key_id) > 0
    error_message = "Key Vault key ID must not be empty"
  }
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  validation {
    condition     = length(var.tags) <= 50
    error_message = "A maximum of 50 tags can be assigned to the resource"
  }
  type = map(string)
}
