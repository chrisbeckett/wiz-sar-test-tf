resource "azurerm_network_security_group" "wiz-test-nsg-016-rpc" {
  name                = "wiz-sar-test-nsg-016-rpc"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundRPCTrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "135"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}