resource "random_string" "random-rg-name-nsg" {
  length = 5
  special = false
  lower = true
}

resource "azurerm_resource_group" "nsg-rg" {
  name     = "wiz-sar-test-nsg-rg-${random_string.random-rg-name-nsg.result}"
  location = var.region
}

resource "azurerm_network_security_group" "rg-nsg" {
  name                = "wiz-sar-test-nsg-001-rdp"
  location            = var.region
  resource_group_name = azurerm_resource_group.nsg-rg.name

  security_rule {
    name                       = "AllowAllInboundRDPTrafficFromTheInternet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}