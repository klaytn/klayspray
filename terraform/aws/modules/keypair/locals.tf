locals {
  default_tags = merge(
    var.tags,
    {
      Name      = var.name
      ManagedBy = "terraform"
    }
  )
}

data "aws_key_pair" "this" {
  count    = var.create_aws_key_pair == false ? 1 : 0
  key_name = var.name
}
