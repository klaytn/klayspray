module "layer1" {
  source = "../modules/private-layer1"

  name       = local.name
  zone_list  = data.google_compute_zones.this.names
  network    = module.vpc.network_self_link
  subnetwork = one([for item in module.vpc.subnets_self_links : item if can(regex("public", item))])

  boot_image_id  = data.google_compute_image.this.self_link
  ssh_client_ips = var.ssh_client_ips

  cn_options      = var.cn_options
  pn_options      = var.pn_options
  en_options      = var.en_options
  monitor_options = var.monitor_options

  metadata = merge(
    var.metadata,
    local.default_metadata,
    { ssh-keys = format("klay:%s klay", trimspace(module.keypair.ssh_public_key)) }
  )
}
