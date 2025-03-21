module "en" {
  count = var.en_options.count

  source = "../modules/kaia-node"

  name               = format("%s-en-%d", local.name, count.index + 1)
  ami_id             = data.aws_ami.this.id
  instance_type      = var.en_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.en.id]
  subnet_id          = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]
  use_eip            = true

  root_block_device = {
    volume_type = "gp2"
    volume_size = var.en_options.ebs_volume_size
  }

  tags = local.default_tags
}

module "scn" {
  count = local.scn_options.count

  source = "../modules/kaia-node"

  name               = format("%s-scn-%d", local.name, count.index + 1)
  ami_id             = data.aws_ami.this.id
  instance_type      = local.scn_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.layer2.id]
  subnet_id          = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]
  use_eip            = true

  root_block_device = {
    volume_type = "gp2"
    volume_size = local.scn_options.ebs_volume_size
  }

  tags = local.default_tags
}
