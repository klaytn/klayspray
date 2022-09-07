resource "tls_private_key" "ssh" {
  count = var.create_aws_key_pair ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "this" {
  count = var.create_aws_key_pair ? 1 : 0

  key_name   = var.key_name == null ? local.name : var.key_name
  public_key = tls_private_key.ssh[0].public_key_openssh

  tags = local.default_tags
}

resource "local_sensitive_file" "this" {
  count = var.create_aws_key_pair ? 1 : 0

  content         = tls_private_key.ssh[0].private_key_openssh
  filename        = format("%s/../../../private-ssh-key.pem", path.module)
  file_permission = "0400"
}

resource "aws_security_group" "l1_common" {
  name = format("%s-layer1-sg", local.name)

  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = [
      { protocol = "tcp", from_port = 22, to_port = 22, cidr_blocks = var.ssh_client_ips },
      { protocol = "tcp", from_port = 32323, to_port = 32324, cidr_blocks = ["0.0.0.0/0"] },
      { protocol = "udp", from_port = 32323, to_port = 32323, cidr_blocks = ["0.0.0.0/0"] },
      { protocol = "tcp", from_port = 32323, to_port = 32324, self = true },
      { protocol = "udp", from_port = 32323, to_port = 32323, self = true },
      { protocol = "tcp", from_port = 61001, to_port = 61001, security_groups = [aws_security_group.monitor.id] },
    ]

    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = try(ingress.value.cidr_blocks, null)
      security_groups = try(ingress.value.security_groups, null)
      self            = try(ingress.value.self, null)
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
