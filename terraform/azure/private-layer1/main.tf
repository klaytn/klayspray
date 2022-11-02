module "layer1" {
  source = "../modules/private-layer1"

  name = local.name

  resource_group_name    = var.resource_group_name
  source_image_reference = local.source_image_reference
  public_key             = module.keypair.ssh_public_key
  ssh_client_ips         = var.ssh_client_ips
  subnet_id              = azurerm_subnet.public.id

  cn_options      = var.cn_options
  pn_options      = var.pn_options
  en_options      = var.en_options
  monitor_options = var.monitor_options

  tags = local.default_tags
}
