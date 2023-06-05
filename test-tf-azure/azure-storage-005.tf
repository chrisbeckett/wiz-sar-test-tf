resource "random_string" "random-rg2-name-storage" {
  length = 6
  special = false
  lower = true
}

resource "azurerm_resource_group" "wiz-sar-test-storage-rg2" {
  name     = "wiz-sar-test-storage-rg-${random_string.random-rg2-name-storage.result}"
  location = var.region
}

resource "azurerm_virtual_network" "wiz-sar-test-storage2-vnet" {
  name                = "wizsarvnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.region
  resource_group_name = azurerm_resource_group.wiz-sar-test-storage-rg2.name
}

resource "azurerm_subnet" "wiz-sar-test-storage-subnet" {
  name                 = "subnetname"
  resource_group_name  = azurerm_resource_group.wiz-sar-test-storage-rg2.name
  virtual_network_name = azurerm_virtual_network.wiz-sar-test-storage2-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_storage_account" "wiz-sar-test-sa2" {
  name                     = "wizsartest${lower(random_string.random-rg2-name-storage.result)}"
  resource_group_name      = azurerm_resource_group.wiz-sar-test-storage-rg2.name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
     default_action             = "Deny"
     ip_rules                   = var.my_ip_address
     virtual_network_subnet_ids = [azurerm_subnet.wiz-sar-test-storage-subnet.id]
     bypass                     = ["None"]
   }
}

resource "azurerm_storage_container" "wiz-sar-test-sc2" {
  name                  = "wiztest"
  storage_account_name  = azurerm_storage_account.wiz-sar-test-sa2.name
  container_access_type = "container"
}