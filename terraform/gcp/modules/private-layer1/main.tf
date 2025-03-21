module "cn" {
  count = local.cn_options.count

  source = "../klaytn-node"

  name         = format("%s-cn-%d", var.name, count.index + 1)
  machine_type = local.cn_options.machine_type

  subnetwork    = var.subnetwork
  zone          = var.zone_list[count.index % length(var.zone_list)]
  use_public_ip = true
  region        = var.gcp_region
  network_tier  = var.network_tier

  boot_disk = {
    image_id       = var.boot_image_id
    boot_disk_size = local.cn_options.boot_disk_size
  }

  # compute_disk = {
  #   name = format("%s-cn-%d-disk", var.name, count.index + 1)
  #   type = "pd-ssd"
  #   zone = var.zone_list[count.index % length(var.zone_list)]
  #   size = 100
  # }

  tags = length(var.network_tags) > 0 ? concat(var.network_tags) : ["klayspray", "cn"]

  metadata = merge(var.metadata, {
    Name = format("%s-cn-%d", var.name, count.index + 1)
  })
}

module "pn" {
  count = local.pn_options.count

  source = "../klaytn-node"

  name         = format("%s-pn-%d", var.name, count.index + 1)
  machine_type = local.pn_options.machine_type

  subnetwork    = var.subnetwork
  zone          = var.zone_list[count.index % length(var.zone_list)]
  use_public_ip = true
  region        = var.gcp_region
  network_tier  = var.network_tier

  boot_disk = {
    image_id       = var.boot_image_id
    boot_disk_size = local.pn_options.boot_disk_size
  }

  # compute_disk = {
  #   name = format("%s-pn-%d-disk", var.name, count.index + 1)
  #   type = "pd-ssd"
  #   zone = var.zone_list[count.index % length(var.zone_list)]
  #   size = 100
  # }

  tags = length(var.network_tags) > 0 ? concat(var.network_tags) : ["klayspray", "pn"]

  metadata = merge(var.metadata, {
    Name = format("%s-pn-%d", var.name, count.index + 1)
  })
}

module "en" {
  count = local.en_options.count

  source = "../klaytn-node"

  name         = format("%s-en-%d", var.name, count.index + 1)
  machine_type = local.en_options.machine_type

  subnetwork    = var.subnetwork
  zone          = var.zone_list[count.index % length(var.zone_list)]
  use_public_ip = true
  region        = var.gcp_region
  network_tier  = var.network_tier

  boot_disk = {
    image_id       = var.boot_image_id
    boot_disk_size = local.en_options.boot_disk_size
  }

  # compute_disk = {
  #   name = format("%s-en-%d-disk", var.name, count.index + 1)
  #   type = "pd-ssd"
  #   zone = var.zone_list[count.index % length(var.zone_list)]
  #   size = 100
  # }

  tags = length(var.network_tags) > 0 ? concat(var.network_tags) : ["klayspray", "en"]

  metadata = merge(var.metadata, {
    Name = format("%s-en-%d", var.name, count.index + 1)
  })
}

module "monitor" {
  source = "../klaytn-node"

  name         = format("%s-monitor", var.name)
  machine_type = local.monitor_options.machine_type

  subnetwork    = var.subnetwork
  zone          = var.zone_list[0]
  use_public_ip = true
  region        = var.gcp_region
  network_tier  = var.network_tier

  boot_disk = {
    image_id       = var.boot_image_id
    boot_disk_size = local.monitor_options.boot_disk_size
  }

  # compute_disk = {
  #   name = format("%s-monitor-disk", var.name)
  #   type = "pd-ssd"
  #   zone = var.zone_list[count.index % length(var.zone_list)]
  #   size = 100
  # }

  tags = length(var.network_tags) > 0 ? var.network_tags : ["klayspray", "monitor"]

  metadata = merge(var.metadata, {
    Name = format("%s-monitor", var.name)
  })
}
