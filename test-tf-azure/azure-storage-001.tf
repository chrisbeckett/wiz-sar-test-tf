resource "random_string" "random-rg-name-storage" {
  length = 6
  special = false
  lower = true
}

resource "azurerm_resource_group" "wiz-sar-test-storage-rg" {
  name     = "wiz-sar-test-storage-rg-${random_string.random-rg-name-storage.result}"
  location = var.region
}

resource "azurerm_storage_account" "wiz-sar-test-sa" {
  name                     = "wizsartest${lower(random_string.random-rg-name-storage.result)}"
  resource_group_name      = azurerm_resource_group.wiz-sar-test-storage-rg.name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = false 
}

resource "azurerm_storage_container" "wiz-sar-test-sc" {
  name                  = "wiztest"
  storage_account_name  = azurerm_storage_account.wiz-sar-test-sa.name
  container_access_type = "container"
}