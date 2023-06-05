resource "azurerm_network_security_group" "wiz-test-nsg-018-telnet" {
  name                = "wiz-sar-test-nsg-018-telnet"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundTelnetTrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "23"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}