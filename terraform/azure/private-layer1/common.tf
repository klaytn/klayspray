module "keypair" {
  source = "../modules/keypair"

  name                  = var.key_name == null ? local.name : var.key_name
  resource_group_name   = var.resource_group_name
  create_azure_key_pair = var.create_azure_key_pair
  ssh_private_key_path  = format("%s/../../../azure-private-ssh-key.pem", path.module)
}
