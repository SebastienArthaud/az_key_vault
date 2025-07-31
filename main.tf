locals {
  private_endpoint_name = "PEP-EUR-FR-${var.environment}-${upper(var.keyvault_name)}"

}

resource "azurerm_key_vault" "keyvault" {
  name                            = var.keyvault_name
  location                        = var.location
  resource_group_name             = var.resource_group
  tenant_id                       = var.tenant_id
  sku_name                        = var.sku_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = tonumber(var.soft_delete_retention_days)
  purge_protection_enabled        = var.purge_protection_enabled
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  network_acls {
    default_action             = var.network_rules_default_action
    bypass                     = var.network_rules_bypass
    virtual_network_subnet_ids = var.network_rules_subnet_ids  #[]
    ip_rules                   = var.network_rules_allowed_ips #[]
  }
}

module "vault_private_endpoint" {
  count                               = var.public_network_access_enabled == false ? 1 : 0
  source                              = "../azure_private_endpoint"
  private_endpoint_name               = "${local.private_endpoint_name}-FILE"
  subnet_name                         = var.private_endpoint_subnet_name
  virtual_network_name                = var.private_endpoint_virtual_network_name
  virtual_network_resource_group_name = var.virtual_network_resource_group_name
  resource_group_name                 = var.resource_group
  private_connection_resource_id      = azurerm_key_vault.keyvault.id
  subresourceType                     = "vault"
}

# Access policy : RW
resource "azurerm_key_vault_access_policy" "policy_rw" {
  for_each     = toset(var.access_policy_rw_id)
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = var.tenant_id
  object_id    = each.key

  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete"]
  secret_permissions      = ["Get", "List", "Set", "Delete"]

  depends_on = [azurerm_key_vault.keyvault]
}

# Access policy : RO
resource "azurerm_key_vault_access_policy" "policy_ro" {
  for_each     = toset(var.access_policy_ro_id)
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = var.tenant_id
  object_id    = each.key

  secret_permissions      = ["Get", "List"]
  certificate_permissions = ["Get", "List"]

  depends_on = [azurerm_key_vault.keyvault]
}

resource "azurerm_key_vault_access_policy" "policy_All" {
  for_each     = toset(var.access_policy_all_id)
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = var.tenant_id
  object_id    = each.key

  # Exemples de permissions
  certificate_permissions = [
    "Backup", "Create", "Delete", "DeleteIssuers",
    "Get", "GetIssuers", "Import", "List", "ListIssuers",
    "ManageContacts", "ManageIssuers", "Purge",
    "Recover", "Restore", "SetIssuers", "Update"
  ]

  secret_permissions = [
    "Backup", "Delete", "Get", "List",
    "Purge", "Recover", "Restore", "Set"
  ]

  depends_on = [azurerm_key_vault.keyvault]
}
