locals {
  cn_options = {
    count          = lookup(var.cn_options, "count", 4)
    machine_type   = lookup(var.cn_options, "machine_type", "e2-medium")
    boot_disk_size = lookup(var.cn_options, "boot_disk_size", 500)
  }

  pn_options = {
    count          = lookup(var.pn_options, "count", 4)
    machine_type   = lookup(var.pn_options, "machine_type", "e2-medium")
    boot_disk_size = lookup(var.pn_options, "boot_disk_size", 500)
  }

  en_options = {
    count          = lookup(var.en_options, "count", 4)
    machine_type   = lookup(var.en_options, "machine_type", "e2-medium")
    boot_disk_size = lookup(var.en_options, "boot_disk_size", 500)
  }

  monitor_options = {
    machine_type   = lookup(var.monitor_options, "machine_type", "e2-medium")
    boot_disk_size = lookup(var.monitor_options, "boot_disk_size", 500)
  }
}
