data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}

data "aws_key_pair" "this" {
  count    = var.create_aws_key_pair == false ? 1 : 0
  key_name = var.key_name
}
