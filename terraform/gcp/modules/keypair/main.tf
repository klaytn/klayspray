resource "tls_private_key" "this" {
  count = var.create_gcp_key_pair ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_sensitive_file" "this" {
  count = var.create_gcp_key_pair ? 1 : 0

  content         = tls_private_key.this[0].private_key_pem
  filename        = var.ssh_private_key_path
  file_permission = "0400"
}

# Extract public key from generated private key
data "tls_public_key" "this" {
  count = var.create_gcp_key_pair ? 1 : 0
  private_key_pem = tls_private_key.this[0].private_key_pem
}

# Read existing public key when not creating a new key pair
data "local_file" "existing_public_key" {
  count    = var.create_gcp_key_pair ? 0 : 1
  filename = var.ssh_existing_public_key_path
}

locals {
  # Use the appropriate key and public key based on configuration
  private_key_path = var.create_gcp_key_pair ? var.ssh_private_key_path : var.ssh_existing_private_key_path
  public_key = var.create_gcp_key_pair ? data.tls_public_key.this[0].public_key_openssh : data.local_file.existing_public_key[0].content
}
