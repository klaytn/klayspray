locals {
  cn_options = {
    count         = lookup(var.cn_options, "count", 4)
    instance_size = lookup(var.cn_options, "instance_size", "Standard_D2_v5")
    os_disk_size  = lookup(var.cn_options, "os_disk_size", 100)
  }

  pn_options = {
    count         = lookup(var.pn_options, "count", 4)
    instance_size = lookup(var.pn_options, "instance_size", "Standard_D2_v5")
    os_disk_size  = lookup(var.pn_options, "os_disk_size", 100)
  }

  en_options = {
    count         = lookup(var.en_options, "count", 4)
    instance_size = lookup(var.en_options, "instance_size", "Standard_D2_v5")
    os_disk_size  = lookup(var.en_options, "os_disk_size", 100)
  }

  monitor_options = {
    instance_size = lookup(var.monitor_options, "instance_size", "Standard_B2s")
    os_disk_size  = lookup(var.monitor_options, "os_disk_size", 100)
  }

  default_tags = merge(
    var.tags,
    {
      Name      = var.name
      ManagedBy = "terraform"
    }
  )
}
