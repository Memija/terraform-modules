# Terraform Modules

This repository contains Terraform modules for creating Azure resources.

## Modules

### 1. `storage_account`

Creates an Azure Storage Account with optional user-assigned identity and customer-managed keys.

**Inputs:**
- `name`: Name of the storage account.
- `resource_group_name`: Name of the resource group.
- `location`: Azure region.
- `account_replication_type`: Replication type (e.g., LRS, GRS).
- `retention_in_days`: Retention period for blobs and containers (default: 7).
- `user_assigned_identity_id`: ID of the user-assigned identity.
- `key_vault_key_id`: ID of the Key Vault key for CMK.
- `tags`: Resource tags.
- `public_network_access_enabled`: Enable/disable public network access (default: false).
- `allow_nested_items_to_be_public`: Enable/disable nested public access (default: false).
- `shared_access_key_enabled`: Enable/disable shared access keys (default: true).

### 2. `private_endpoint`

Creates an Azure Private Endpoint.

**Inputs:**
- `name`: Name of the private endpoint.
- `resource_group_name`: Name of the resource group.
- `location`: Azure region.
- `subnet_id`: ID of the subnet.
- `private_connection_resource_id`: ID of the resource to connect to.
- `subresource_name`: Name of the subresource (e.g., blob, file).
- `private_dns_zone_ids`: List of private DNS zone IDs (optional).
- `tags`: Resource tags.

### 3. `role_assignment`

Creates an Azure Role Assignment.

**Inputs:**
- `scope`: The scope of the role assignment (subscription, resource group, or resource).
- `role_definition_name`: Name of the role (e.g., "Contributor", "Reader").
- `principal_id`: ID of the principal (user, group, SP).
- `principal_type`: Type of the principal (default: "ServicePrincipal").

### 4. `container_registry`

Creates an Azure Container Registry.

**Inputs:**
- `name`: Name of the Container Registry.
- `resource_group_name`: Name of the resource group.
- `location`: Azure region.
- `sku`: The SKU name (Basic, Standard, Premium).
- `admin_enabled`: Enable admin user (default: false).
- `tags`: Resource tags.

### 5. `virtual_network`

Creates an Azure Virtual Network.

**Inputs:**
- `name`: Name of the virtual network.
- `resource_group_name`: Name of the resource group.
- `location`: Azure region.
- `address_space`: Address space for the virtual network (list of CIDRs).
- `dns_servers`: List of DNS server IPs (optional).
- `tags`: Resource tags.

### 6. `log_analytics_workspace`

Creates an Azure Log Analytics Workspace.

**Inputs:**
- `name`: Name of the Log Analytics Workspace.
- `resource_group_name`: Name of the resource group.
- `location`: Azure region.
- `sku`: The SKU (pricing tier) (default: "PerGB2018").
- `retention_in_days`: The workspace data retention in days (default: 30).
- `tags`: Resource tags.

## Usage

See the `variables.tf` file in each module directory for detailed input descriptions and validation rules.
