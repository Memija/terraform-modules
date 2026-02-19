variable "name" {
  description = "The name of the Key Vault"
  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 24 && can(regex("^[a-zA-Z0-9-]{3,24}$", var.name))
    error_message = "The key vault name must be between 3 and 24 characters in length and can contain only alphanumeric characters and hyphens."
  }
  type = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created"
  validation {
    condition     = length(var.location) <= 90 && length(var.location) >= 1
    error_message = "The location must be between 1 and 90 characters long."
  }
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  validation {
    condition     = length(var.tenant_id) == 36 && can(regex("^[0-9a-fA-F-]{36}$", var.tenant_id))
    error_message = "The tenant ID must be a valid GUID."
  }
  type = string
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The SKU name must be either 'standard' or 'premium'."
  }
  default = "standard"
  type = string
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "The soft delete retention days must be between 7 and 90."
  }
  default = 7
  type = number
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault?"
  default = true
  type = bool
}

variable "enable_rbac_authorization" {
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
  default = true
  type = bool
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  validation {
    condition     = length(var.tags) <= 50
    error_message = "A maximum of 50 tags can be assigned to the resource"
  }
  default = {}
  type = map(string)
}
