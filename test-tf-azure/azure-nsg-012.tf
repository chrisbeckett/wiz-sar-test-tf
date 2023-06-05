resource "azurerm_network_security_group" "wiz-test-nsg-012-oracle" {
  name                = "wiz-sar-test-nsg-012-oracle"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundOracleTrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "1521"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}