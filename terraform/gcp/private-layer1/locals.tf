locals {
  name = var.name != null ? var.name : format("%s-%s", random_pet.this.id, random_string.this.id)

  default_metadata = merge(
    var.metadata,
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
