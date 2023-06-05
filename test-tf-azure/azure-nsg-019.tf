resource "azurerm_network_security_group" "wiz-test-nsg-019-vnc" {
  name                = "wiz-sar-test-nsg-019-vnc"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundVNC5500TrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "5500"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "AllowAllInboundVNC5900TrafficFromTheInternet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "5900"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}