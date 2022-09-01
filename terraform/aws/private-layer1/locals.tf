locals {
  name = var.name != null ? var.name : format("%s-%s", random_pet.this.id, random_string.this.id)

  key_name = var.create_aws_key_pair ? aws_key_pair.this[0].key_name : data.aws_key_pair.this[0].key_name

  cn_options = {
    count           = lookup(var.cn_options, "count", 4)
    instance_type   = lookup(var.cn_options, "instance_type", "m5.2xlarge")
    ebs_volume_size = lookup(var.cn_options, "ebs_volume_size", 500)
  }

  pn_options = {
    count           = lookup(var.pn_options, "count", 4)
    instance_type   = lookup(var.pn_options, "instance_type", "m5.2xlarge")
    ebs_volume_size = lookup(var.pn_options, "ebs_volume_size", 500)
  }

  en_options = {
    count           = lookup(var.en_options, "count", 4)
    instance_type   = lookup(var.en_options, "instance_type", "m5.2xlarge")
    ebs_volume_size = lookup(var.en_options, "ebs_volume_size", 500)
  }

  default_tags = merge(
    var.tags,
    {
      Name      = local.name
      ManagedBy = "terraform"
    }
  )
}

resource "random_string" "this" {
  length  = 4
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "random_pet" "this" {}
