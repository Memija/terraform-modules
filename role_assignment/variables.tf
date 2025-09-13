variable "scope" {
  description = <<EOT
    The scope at which the role assignment applies.
    The scope can be subscription, resource group or individual resource.
    For example, in order to assign a role at the resource group level use format:
    /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}
    EOT
  type = string
}

variable "role_definition_name" {
  description = "Role definition name to assign"
  validation {
    condition     = contains([
      "Storage Account Contributor",
      "Storage Blob Data Contributor",
      "Storage Table Data Contributor"
    ], var.role_definition_name)
    error_message = <<EOT
      role_definition_name value must be one of the following:
        - Storage Account Contributor
        - Storage Blob Data Contributor
        - Storage Table Data Contributor
        EOT
  }
  type = string
}

variable "principal_id" {
  description = "The ID of the principal to which the role will be assigned"
  validation {
    condition     = length(var.principal_id) > 0
    error_message = "Principal ID must not be empty"
  }
  type = string
}

variable "principal_type" {
  description = "The type of principal to which the role will be assigned"
  validation {
    condition     = contains([
      "ServicePrincipal",
      "Group"
    ], var.principal_type)
    error_message = <<EOT
      principal_type value must be one of:
        - ServicePrincipal
        - Group
      EOT
  }
  default = "ServicePrincipal"
  type = string
}
