resource "tls_private_key" "this" {
  count = var.create_aws_key_pair ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "this" {
  count = var.create_aws_key_pair ? 1 : 0

  key_name   = var.name
  public_key = tls_private_key.this[0].public_key_openssh

  tags = local.default_tags
}

resource "local_sensitive_file" "this" {
  count = var.create_aws_key_pair ? 1 : 0

  content         = tls_private_key.this[0].private_key_openssh
  filename        = var.ssh_private_key_path
  file_permission = "0400"
}
