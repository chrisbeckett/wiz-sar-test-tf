resource "azurerm_network_security_group" "wiz-test-nsg-010-mongodb" {
  name                = "wiz-sar-test-nsg-010-mongodb"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundMongoDBTrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "27017-27020"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}