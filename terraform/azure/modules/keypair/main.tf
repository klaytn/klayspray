resource "tls_private_key" "this" {
  count = var.create_azure_key_pair == true ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_sensitive_file" "this" {
  count = var.create_azure_key_pair == true ? 1 : 0

  content         = tls_private_key.this[0].private_key_openssh
  filename        = var.ssh_private_key_path
  file_permission = "0400"
}

data "tls_public_key" "this" {
  private_key_pem = tls_private_key.this[0].private_key_pem
}

resource "azurerm_ssh_public_key" "this" {
  count = var.create_azure_key_pair == true ? 1 : 0

  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  public_key          = tls_private_key.this[0].public_key_openssh

  tags = var.tags
}
