resource "azurerm_network_security_group" "wiz-test-nsg-013-netbios" {
  name                = "wiz-sar-test-nsg-013-netbios"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundNetBIOS137TrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "137"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "AllowAllInboundNetBIOS139TrafficFromTheInternet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "139"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}