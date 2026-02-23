variable "name" {
  description = "The name of the subnet"
  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 80 && can(regex("^[a-zA-Z0-9._-]+$", var.name))
    error_message = "The subnet name must be between 1 and 80 characters and can contain only alphanumeric characters, underscores, periods, and hyphens."
  }
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which to create the subnet"
  validation {
    condition     = length(var.virtual_network_name) >= 2 && length(var.virtual_network_name) <= 64 && can(regex("^[a-zA-Z0-9._-]+$", var.virtual_network_name))
    error_message = "The virtual network name must be between 2 and 64 characters and can contain only alphanumeric characters, underscores, periods, and hyphens."
  }
  type = string
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
  validation {
    condition     = length(var.address_prefixes) > 0
    error_message = "The address prefixes must contain at least one CIDR block."
  }
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet."
  type        = list(string)
  default     = []
}

variable "private_endpoint_network_policies_enabled" {
  description = "Enable or Disable network policies for the private endpoint on the subnet."
  type        = bool
  default     = true
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable or Disable network policies for the private link service on the subnet."
  type        = bool
  default     = true
}
