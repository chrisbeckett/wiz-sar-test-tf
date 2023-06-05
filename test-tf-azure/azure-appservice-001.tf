resource "random_string" "random" {
  length = 5
  special = false
}
resource "azurerm_resource_group" "wiz-sar-test-webapp-rg" {
  name     = "wiz-sar-test-webapp-rg"
  location = var.region
}

resource "azurerm_service_plan" "wiz-sar-test-webapp-service-plan" {
  name                = "wiz-sar-webapp-service-plan"
  resource_group_name = azurerm_resource_group.wiz-sar-test-webapp-rg.name
  location            = var.region
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "wiz-sar-test-webapp" {
  name                = "wiz-sar-test-webapp-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.wiz-sar-test-webapp-rg.name
  location            = var.region
  service_plan_id     = azurerm_service_plan.wiz-sar-test-webapp-service-plan.id

  site_config {
    always_on = false
    ftps_state = "AllAllowed"
    minimum_tls_version = "1.0"
  }
}