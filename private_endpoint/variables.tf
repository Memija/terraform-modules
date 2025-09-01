variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "subnet_id" {}
variable "private_connection_resource_id" {}
variable "subresource_name" {}
variable "private_dns_zone_ids" { type = list(string) }
variable "name" { type = map(strong) }
