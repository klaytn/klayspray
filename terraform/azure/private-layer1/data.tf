data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_platform_image" "centos" {
  location  = data.azurerm_resource_group.this.location
  publisher = "OpenLogic"
  offer     = "CentOS"
  sku       = "7.5"
}

data "azurerm_platform_image" "ubuntu" {
  location  = data.azurerm_resource_group.this.location
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
}
