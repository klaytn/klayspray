module "keypair" {
  source = "../modules/keypair"

  name                 = var.key_name == null ? local.name : var.key_name
  create_aws_key_pair  = var.create_aws_key_pair
  ssh_private_key_path = format("%s/../../../private-ssh-key.pem", path.module)

  tags = var.tags
}
