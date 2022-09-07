module "monitor" {
  source = "../modules/klaytn-node"

  name               = format("%s-monitor", local.name)
  ami_id             = data.aws_ami.this.id
  instance_type      = local.monitor_options.instance_type
  key_name           = local.key_name
  security_group_ids = [aws_security_group.monitor.id]
  subnet_id          = module.vpc.public_subnets[0]

  root_block_device = {
    volume_type = "gp2"
    volume_size = local.monitor_options.ebs_volume_size
  }

  tags = local.default_tags
}

resource "aws_security_group" "monitor" {
  name = format("%s-monitor-sg", local.name)

  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = [
      { protocol = "tcp", from_port = 22, to_port = 22, cidr_blocks = var.ssh_client_ips },
      { protocol = "tcp", from_port = 9090, to_port = 9090, cidr_blocks = ["0.0.0.0/0"] },
      { protocol = "tcp", from_port = 3000, to_port = 3000, cidr_blocks = ["0.0.0.0/0"] },
    ]

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = try(ingress.value.cidr_blocks, null)
      self        = try(ingress.value.self, null)
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.default_tags
}
