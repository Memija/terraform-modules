variable "name" {
  description = "Private endpoint name"
  validation {
    condition     = length(var.name) <= 80 && length(var.name) >= 3
    error_message = "The name must be between 3 and 80 characters long."
  }
  type = string
}
variable "resource_group_name" {
  description = "Resource group name in which the private endpoint will be created"
  validation {
    condition     = length(var.resource_group_name) <= 90 && length(var.resource_group_name) >= 1
    error_message = "The resource group name must be between 1 and 90 characters long."
  }
  type = string
}
variable "location" {
  description = "The Azure region where the private endpoint will be created"
  validation {
    condition     = length(var.location) <= 90 && length(var.location) >= 1
    error_message = "The location must be between 1 and 90 characters long."
  }
  type = string
}
variable "subnet_id" {
  description = "The ID of the subnet to which the private endpoint will be connected"
  validation {
    condition     = length(var.subnet_id) <= 2048 && length(var.subnet_id) >= 1
    error_message = "The subnet ID must be between 1 and 2048 characters long."
  }
  type = string
}
variable "private_connection_resource_id" {
  description = "The resource ID of the resource to which the private endpoint will be connected"
  validation {
    condition     = length(var.private_connection_resource_id) <= 2048 && length(var.private_connection_resource_id) >= 1
    error_message = "The private connection resource ID must be between 1 and 2048 characters long."
  }
  type = string
}
variable "subresource_name" {
  description = "The name of the subresource to which the private endpoint will be connected"
  validation {
    condition     = length(var.subresource_name) <= 128 && length(var.subresource_name) >= 1
    error_message = "The subresource name must be between 1 and 128 characters long."
  }
  type = string
}
variable "private_dns_zone_ids" {
  description = "A list of private DNS zone IDs to be linked with the private endpoint"
  default     = []
  type        = list(string)
}
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  validation {
    condition     = length(var.tags) <= 50
    error_message = "A maximum of 50 tags can be assigned to the resource."
  }
  type = map(string)
}
