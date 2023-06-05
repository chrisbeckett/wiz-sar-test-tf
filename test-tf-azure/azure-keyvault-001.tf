provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = false
    }
  }
}

resource "random_string" "random-rg-name-kv" {
  length = 5
  special = false
  lower = true
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg-kv" {
  name     = "wiz-sar-test-rg-${random_string.random-rg-name-kv.result}"
  location = var.region
}

resource "azurerm_key_vault" "example" {
  name                        = "wiz-sar-test-kv-${random_string.random-rg-name-kv.result}"
  location                    = var.region
  resource_group_name         = azurerm_resource_group.rg-kv.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false

  sku_name = "standard"
}
