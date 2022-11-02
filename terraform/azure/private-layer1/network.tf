resource "azurerm_virtual_network" "this" {
  name                = format("%s-network", local.name)
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  address_space       = ["10.0.0.0/16"]

  tags = local.default_tags
}

resource "azurerm_subnet" "public" {
  name                 = format("%s-public-subnet", local.name)
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "private" {
  name                 = format("%s-private-subnet", local.name)
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.2.0/24"]
}
