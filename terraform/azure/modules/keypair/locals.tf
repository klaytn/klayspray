locals {
  default_tags = merge(
    var.tags,
    {
      Name      = var.name
      ManagedBy = "terraform"
    }
  )
}

data "azurerm_ssh_public_key" "this" {
  count               = var.create_azure_key_pair == false ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
}
