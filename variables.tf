variable "keyvault_name" {
  type        = string
  description = "Nom du Key Vault"
}

variable "location" {
  type        = string
  description = "Localisation"
  default     = "westeurope"
}

variable "resource_group" {
  type        = string
  description = "Nom du Resource Group"
}

variable "environment" {
  type        = string
  description = "Environnement de déploiement des ressources"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
  default     = "f30ac191-b8b4-45f2-9a9b-e5466cb90c2f"
}

variable "sku_name" {
  type        = string
  description = "SKU du Key Vault (standard ou premium)"
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Activer la disk encryption ?"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = string
  description = "Durée (en jours) de rétention en soft-delete"
  default     = "14"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Activer la purge protection ?"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Autoriser l'accès public ?"
  default     = false
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Key Vault accessible aux VMs ?"
  default     = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Key Vault accessible aux ARM templates ?"
  default     = false
}

variable "access_policy_all_id" {
  type        = list(string)
  description = "Object ID des objet Entra qui auront un accès complet au key vault"
  default     = []
}

variable "access_policy_ro_id" {
  type        = list(string)
  description = "Object ID des objet Entra qui auront un accès Read Only au key vault"
  default     = []
}

variable "access_policy_rw_id" {
  type        = list(string)
  description = "Object ID des objet Entra qui auront un accès Write au key vault"
  default     = []
}


variable "tags" {
  type        = map(string)
  description = "Map de tags"
  default     = {}
}


variable "private_endpoint_subnet_name" {
  type        = string
  description = "Subnet ou sera déployé le private endpoint"
  default     = null
}

variable "private_endpoint_virtual_network_name" {
  type        = string
  description = "VNET ou sera déployé le private endpoint"
  default     = null
}

variable "virtual_network_resource_group_name" {
  type        = string
  description = "Nom du resource group du réseau virtuel (VNET) ou sera créé le private endpoint, obligatoire si le storage account a un private endpoint"
  default     = null
}

variable "network_rules_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match"
  default     = "Deny"
}

variable "network_rules_bypass" {
  type        = string
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  default     = "AzureServices"
}

variable "network_rules_subnet_ids" {
  type        = list(string)
  description = "A list of resource ids for subnets."
  default     = []
}

variable "network_rules_allowed_ips" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. /31 CIDRs, /32 CIDRs, and Private IP address ranges (as defined in RFC 1918), are not allowed."
  default = [
    "194.9.96.0/20",
    "147.161.178.0/23",
    "147.161.180.0/23",
    "147.161.182.0/23",
    "77.198.202.228"
  ]
}


variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions"
  default     = false
}