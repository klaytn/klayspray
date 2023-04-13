locals {
  name = var.name != null ? var.name : format("%s-%s", random_pet.this.id, random_string.this.id)

  key_name = module.keypair.key_name

  scn_options = {
    count           = lookup(var.scn_options, "count", 1)
    instance_type   = lookup(var.scn_options, "instance_type", "m6i.large")
    ebs_volume_size = lookup(var.scn_options, "ebs_volume_size", 500)
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
