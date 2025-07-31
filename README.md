<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vault_private_endpoint"></a> [vault\_private\_endpoint](#module\_vault\_private\_endpoint) | ../azure_private_endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.policy_All](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.policy_ro](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.policy_rw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environnement de déploiement des ressources | `string` | n/a | yes |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | Nom du Key Vault | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Nom du Resource Group | `string` | n/a | yes |
| <a name="input_access_policy_all_id"></a> [access\_policy\_all\_id](#input\_access\_policy\_all\_id) | Object ID des objet Entra qui auront un accès complet au key vault | `list(string)` | `[]` | no |
| <a name="input_access_policy_ro_id"></a> [access\_policy\_ro\_id](#input\_access\_policy\_ro\_id) | Object ID des objet Entra qui auront un accès Read Only au key vault | `list(string)` | `[]` | no |
| <a name="input_access_policy_rw_id"></a> [access\_policy\_rw\_id](#input\_access\_policy\_rw\_id) | Object ID des objet Entra qui auront un accès Write au key vault | `list(string)` | `[]` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions | `bool` | `false` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Key Vault accessible aux VMs ? | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Activer la disk encryption ? | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Key Vault accessible aux ARM templates ? | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Localisation | `string` | `"westeurope"` | no |
| <a name="input_network_rules_allowed_ips"></a> [network\_rules\_allowed\_ips](#input\_network\_rules\_allowed\_ips) | List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. /31 CIDRs, /32 CIDRs, and Private IP address ranges (as defined in RFC 1918), are not allowed. | `list(string)` | `[]` | no |
| <a name="input_network_rules_bypass"></a> [network\_rules\_bypass](#input\_network\_rules\_bypass) | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None. | `string` | `"AzureServices"` | no |
| <a name="input_network_rules_default_action"></a> [network\_rules\_default\_action](#input\_network\_rules\_default\_action) | Specifies the default action of allow or deny when no other rules match | `string` | `"Deny"` | no |
| <a name="input_network_rules_subnet_ids"></a> [network\_rules\_subnet\_ids](#input\_network\_rules\_subnet\_ids) | A list of resource ids for subnets. | `list(string)` | `[]` | no |
| <a name="input_private_endpoint_subnet_name"></a> [private\_endpoint\_subnet\_name](#input\_private\_endpoint\_subnet\_name) | Subnet ou sera déployé le private endpoint | `string` | `null` | no |
| <a name="input_private_endpoint_virtual_network_name"></a> [private\_endpoint\_virtual\_network\_name](#input\_private\_endpoint\_virtual\_network\_name) | VNET ou sera déployé le private endpoint | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Autoriser l'accès public ? | `bool` | `false` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Activer la purge protection ? | `bool` | `true` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU du Key Vault (standard ou premium) | `string` | `"standard"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Durée (en jours) de rétention en soft-delete | `string` | `"14"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map de tags | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | `"f30ac191-b8b4-45f2-9a9b-e5466cb90c2f"` | no |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | Nom du resource group du réseau virtuel (VNET) ou sera créé le private endpoint, obligatoire si le storage account a un private endpoint | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | ID du Key Vault |
| <a name="output_keyvault_name"></a> [keyvault\_name](#output\_keyvault\_name) | Nom du Key Vault |
| <a name="output_keyvault_uri"></a> [keyvault\_uri](#output\_keyvault\_uri) | URI du Key Vault |
<!-- END_TF_DOCS -->