# ☁️ Azure Terraform Modules

![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)

This repository contains a collection of reusable Terraform modules for provisioning various Azure resources. These modules are designed to be modular, scalable, and easy to integrate into your infrastructure-as-code (IaC) pipelines.

---

## 📂 Project Structure

```bash
.
├── container_registry/
├── key_vault/
├── log_analytics_workspace/
├── private_endpoint/
├── role_assignment/
├── storage_account/
├── subnet/
└── virtual_network/
```

---

## 📦 Modules

| Module | Description |
| :--- | :--- |
| [Storage Account](#1-storage-account) | Creates an Azure Storage Account with advanced security features. |
| [Private Endpoint](#2-private-endpoint) | Provisions a Private Endpoint for secure connectivity. |
| [Role Assignment](#3-role-assignment) | Manages Azure RBAC role assignments. |
| [Container Registry](#4-container-registry) | Deploys an Azure Container Registry (ACR). |
| [Virtual Network](#5-virtual-network) | Sets up an Azure Virtual Network (VNet). |
| [Log Analytics Workspace](#6-log-analytics-workspace) | Creates a Log Analytics Workspace for monitoring. |
| [Subnet](#7-subnet) | Configures a Subnet within a Virtual Network. |
| [Key Vault](#8-key-vault) | Provisions an Azure Key Vault for secrets management. |

---

### 1. `storage_account`

Creates an Azure Storage Account with optional user-assigned identity and customer-managed keys (CMK).

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | The name of the storage account (3-24 chars, lowercase alphanumeric). |
| `resource_group_name` | `string` | **Required** | The name of the resource group. |
| `location` | `string` | **Required** | The Azure region. |
| `account_replication_type` | `string` | **Required** | Replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS). |
| `user_assigned_identity_id` | `string` | **Required** | ID of the user-assigned identity. |
| `key_vault_key_id` | `string` | **Required** | ID of the Key Vault key for CMK. |
| `tags` | `map(string)` | **Required** | A map of tags to assign to the resource. |
| `retention_in_days` | `number` | `7` | Retention period for blobs and containers in days. |
| `public_network_access_enabled` | `bool` | `false` | Enable/disable public network access. |
| `allow_nested_items_to_be_public` | `bool` | `false` | Enable/disable nested public access. |
| `shared_access_key_enabled` | `bool` | `true` | Enable/disable shared access keys. |

### 2. `private_endpoint`

Creates an Azure Private Endpoint to securely connect to Azure resources.

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | Name of the private endpoint. |
| `resource_group_name` | `string` | **Required** | Name of the resource group. |
| `location` | `string` | **Required** | Azure region. |
| `subnet_id` | `string` | **Required** | ID of the subnet. |
| `private_connection_resource_id` | `string` | **Required** | ID of the resource to connect to. |
| `subresource_name` | `string` | **Required** | Name of the subresource (e.g., blob, file, vault). |
| `tags` | `map(string)` | **Required** | A map of tags to assign to the resource. |
| `private_dns_zone_ids` | `list(string)` | `[]` | List of private DNS zone IDs. |

### 3. `role_assignment`

Creates an Azure Role Assignment.

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `scope` | `string` | **Required** | The scope of the role assignment (subscription, RG, or resource). |
| `role_definition_name` | `string` | **Required** | Name of the role (e.g., "Contributor", "Reader"). |
| `principal_id` | `string` | **Required** | ID of the principal (user, group, SP). |
| `principal_type` | `string` | `"ServicePrincipal"` | Type of the principal. |

### 4. `container_registry`

Creates an Azure Container Registry (ACR).

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | Name of the Container Registry. |
| `resource_group_name` | `string` | **Required** | Name of the resource group. |
| `location` | `string` | **Required** | Azure region. |
| `sku` | `string` | `"Standard"` | The SKU name (Basic, Standard, Premium). |
| `admin_enabled` | `bool` | `false` | Enable admin user. |
| `tags` | `map(string)` | `{}` | A map of tags to assign to the resource. |

### 5. `virtual_network`

Creates an Azure Virtual Network.

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | Name of the virtual network. |
| `resource_group_name` | `string` | **Required** | Name of the resource group. |
| `location` | `string` | **Required** | Azure region. |
| `address_space` | `list(string)` | **Required** | Address space for the virtual network (list of CIDRs). |
| `tags` | `map(string)` | **Required** | A map of tags to assign to the resource. |
| `dns_servers` | `list(string)` | `[]` | List of DNS server IPs. |

### 6. `log_analytics_workspace`

Creates an Azure Log Analytics Workspace.

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | Name of the Log Analytics Workspace. |
| `resource_group_name` | `string` | **Required** | Name of the resource group. |
| `location` | `string` | **Required** | Azure region. |
| `sku` | `string` | `"PerGB2018"` | The SKU (pricing tier). |
| `retention_in_days` | `number` | `30` | The workspace data retention in days (30-730). |
| `tags` | `map(string)` | `{}` | A map of tags to assign to the resource. |

### 7. `subnet`

Creates an Azure Subnet.

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | Name of the subnet. |
| `resource_group_name` | `string` | **Required** | Name of the resource group. |
| `virtual_network_name` | `string` | **Required** | Name of the virtual network. |
| `address_prefixes` | `list(string)` | **Required** | List of address prefixes for the subnet. |
| `service_endpoints` | `list(string)` | `[]` | List of Service endpoints to associate with the subnet. |
| `private_endpoint_network_policies_enabled` | `bool` | `true` | Enable/Disable network policies for private endpoints. |
| `private_link_service_network_policies_enabled` | `bool` | `true` | Enable/Disable network policies for private link services. |

### 8. `key_vault`

Creates an Azure Key Vault.

| Input | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | `string` | **Required** | Name of the Key Vault (3-24 chars). |
| `location` | `string` | **Required** | Azure region. |
| `resource_group_name` | `string` | **Required** | Name of the resource group. |
| `tenant_id` | `string` | **Required** | Azure AD tenant ID (GUID). |
| `sku_name` | `string` | `"standard"` | SKU name (standard, premium). |
| `soft_delete_retention_days` | `number` | `7` | Retention days for soft-deleted items (7-90). |
| `purge_protection_enabled` | `bool` | `true` | Enable Purge Protection. |
| `enable_rbac_authorization` | `bool` | `true` | Enable RBAC authorization. |
| `tags` | `map(string)` | `{}` | A map of tags to assign to the resource. |

---

## 🚀 Usage Example

Here is a basic example of how to use the `storage_account` module:

```hcl
module "example_storage" {
  source = "./storage_account"

  name                          = "examplestacc123"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  account_replication_type      = "LRS"
  user_assigned_identity_id     = azurerm_user_assigned_identity.example.id
  key_vault_key_id              = azurerm_key_vault_key.example.id
  public_network_access_enabled = false
  tags = {
    Environment = "Dev"
    Project     = "TerraformModules"
  }
}
```

---

## 🛠️ Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 0.12
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

---

## 📄 License

This project is licensed under the MIT License.
