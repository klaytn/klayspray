module "layer1" {
  source = "../modules/private-layer1"

  name = local.name

  aws_region = var.aws_region
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  ami_id         = data.aws_ami.this.id
  key_name       = local.key_name
  ssh_client_ips = var.ssh_client_ips

  cn_options      = var.cn_options
  pn_options      = var.cn_options
  en_options      = var.en_options
  monitor_options = var.monitor_options

  tags = var.tags
}

module "scn" {
  count = local.scn_options.count

  source = "../modules/klaytn-node"

  name               = format("%s-scn-%d", local.name, count.index + 1)
  ami_id             = data.aws_ami.this.id
  instance_type      = local.scn_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.layer2.id]
  subnet_id          = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  root_block_device = {
    volume_type = "gp2"
    volume_size = local.scn_options.ebs_volume_size
  }

  tags = local.default_tags
}
