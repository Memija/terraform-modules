variable "name" {
  description = "The name of the virtual network"
  validation {
    condition     = length(var.name) >= 2 && length(var.name) <= 64 && can(regex("^[a-zA-Z0-9._-]+$", var.name))
    error_message = "The virtual network name must be between 2 and 64 characters and can contain only alphanumeric characters, underscores, periods, and hyphens."
  }
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string
}

variable "location" {
  description = "The Azure region where the virtual network will be created"
  validation {
    condition     = length(var.location) <= 90 && length(var.location) >= 1
    error_message = "The location must be between 1 and 90 characters long."
  }
  type = string
}

variable "address_space" {
  description = "The address space that is used the virtual network."
  type        = list(string)
  validation {
    condition     = length(var.address_space) > 0
    error_message = "The address space must contain at least one CIDR block."
  }
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  validation {
    condition     = length(var.tags) <= 50
    error_message = "A maximum of 50 tags can be assigned to the resource"
  }
  type = map(string)
}
