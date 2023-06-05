resource "random_string" "random-rg-name-sql" {
  length = 5
  special = false
  lower = true
}

resource "random_password" "sql-password" {
  length           = 16
  special          = true
  lower = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_resource_group" "rg-sql" {
  name     = "wiz-sar-test-sql-rg-${random_string.random-rg-name-sql.result}"
  location = var.region
}

resource "azurerm_storage_account" "sql-sa" {
  name                     = "wizsartestsa${lower(random_string.random-rg-name-sql.result)}"
  resource_group_name      = azurerm_resource_group.rg-sql.name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "wiz-sar-test-sql-server" {
  name                         = "wizsartestsql${lower(random_string.random-rg-name-sql.result)}"
  resource_group_name          = azurerm_resource_group.rg-sql.name
  location                     = var.region
  version                      = "12.0"
  administrator_login          = "wizsarsqladmin"
  administrator_login_password = random_password.sql-password.result
}

resource "azurerm_mssql_database" "twiz-sar-test-sql-db" {
  name           = "wizsartestsqldb-${random_string.random-rg-name-sql.result}"
  server_id      = azurerm_mssql_server.wiz-sar-test-sql-server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  sku_name       = "Basic"
  zone_redundant = false
  # TDE must be disabled after creation, TF will not allow this on this SKU
}