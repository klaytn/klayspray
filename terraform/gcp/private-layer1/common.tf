module "keypair" {
  source = "../modules/keypair"

  name                 = local.name
  create_gcp_key_pair  = var.create_gcp_key_pair
  ssh_private_key_path = format("%s/../../../gcp-private-ssh-key.pem", path.module)
}
