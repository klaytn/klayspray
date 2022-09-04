module "cn" {
  count = local.cn_options.count

  source = "../modules/klaytn-node"

  name               = format("%s-cn-%d", local.name, count.index + 1)
  ami_id             = data.aws_ami.this.id
  instance_type      = local.cn_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.l1_common.id]
  subnet_id          = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  root_block_device = {
    volume_type = "gp2"
    volume_size = local.cn_options.ebs_volume_size
  }

  tags = local.default_tags
}

module "pn" {
  count = local.pn_options.count

  source = "../modules/klaytn-node"

  name               = format("%s-pn-%d", local.name, count.index + 1)
  ami_id             = data.aws_ami.this.id
  instance_type      = local.pn_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.l1_common.id]
  subnet_id          = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  root_block_device = {
    volume_type = "gp2"
    volume_size = local.cn_options.ebs_volume_size
  }

  tags = local.default_tags
}

module "en" {
  count = local.en_options.count

  source = "../modules/klaytn-node"

  name               = format("%s-en-%d", local.name, count.index + 1)
  ami_id             = data.aws_ami.this.id
  instance_type      = local.en_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.l1_common.id]
  subnet_id          = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  root_block_device = {
    volume_type = "gp2"
    volume_size = local.cn_options.ebs_volume_size
  }

  tags = local.default_tags
}
