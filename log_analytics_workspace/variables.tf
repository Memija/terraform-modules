variable "name" {
  description = "The name of the Log Analytics Workspace"
  validation {
    condition     = length(var.name) >= 4 && length(var.name) <= 63 && can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]$", var.name))
    error_message = "The Log Analytics Workspace name must be between 4 and 63 characters long, and can only contain alphanumeric characters and hyphens."
  }
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Log Analytics Workspace"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string
}

variable "location" {
  description = "The Azure region where the Log Analytics Workspace will be created"
  validation {
    condition     = length(var.location) <= 90 && length(var.location) >= 1
    error_message = "The location must be between 1 and 90 characters long."
  }
  type = string
}

variable "sku" {
  description = "The SKU (pricing tier) of the Log Analytics Workspace"
  validation {
    condition     = contains(["Free", "Standard", "Premium", "PerNode", "PerGB2018", "Standalone", "CapacityReservation"], var.sku)
    error_message = <<EOT
      sku value must be one of the following:
        - Free
        - Standard
        - Premium
        - PerNode
        - PerGB2018
        - Standalone
        - CapacityReservation
      EOT
  }
  default = "PerGB2018"
  type = string
}

variable "retention_in_days" {
  description = "The workspace data retention in days."
  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "Retention period must be between 30 and 730 days."
  }
  default = 30
  type = number
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
