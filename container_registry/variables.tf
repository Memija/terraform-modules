variable "name" {
  description = "The name of the Container Registry"
  validation {
    condition     = length(var.name) >= 5 && length(var.name) <= 50 && can(regex("^[a-zA-Z0-9]*$", var.name))
    error_message = "The container registry name must be between 5 and 50 characters in length and can contain only alphanumeric characters."
  }
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string
}

variable "location" {
  description = "The Azure region where the Container Registry will be created"
  validation {
    condition     = length(var.location) <= 90 && length(var.location) >= 1
    error_message = "The location must be between 1 and 90 characters long."
  }
  type = string
}

variable "sku" {
  description = "The SKU name of the Container Registry"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The SKU name must be either 'Basic', 'Standard' or 'Premium'."
  }
  default = "Standard"
  type = string
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled"
  default = false
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
