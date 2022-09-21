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
