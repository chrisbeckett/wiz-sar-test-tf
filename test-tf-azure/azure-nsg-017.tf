resource "azurerm_network_security_group" "wiz-test-nsg-017-smtp" {
  name                = "wiz-sar-test-nsg-017-smtp"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundSMTPTrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "25"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}