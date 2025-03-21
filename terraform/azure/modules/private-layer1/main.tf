module "cn" {
  count = local.cn_options.count

  source = "../kaia-node"

  name                   = format("%s-cn-%d", var.name, count.index + 1)
  resource_group_name    = var.resource_group_name
  instance_size          = local.cn_options.instance_size
  public_key             = var.public_key
  source_image_reference = var.source_image_reference
  subnet_id              = var.subnet_id
  security_group_id      = azurerm_network_security_group.layer1.id

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = local.cn_options.os_disk_size
  }

  tags = local.default_tags
}

module "pn" {
  count = local.pn_options.count

  source = "../kaia-node"

  name                   = format("%s-pn-%d", var.name, count.index + 1)
  resource_group_name    = var.resource_group_name
  instance_size          = local.pn_options.instance_size
  public_key             = var.public_key
  source_image_reference = var.source_image_reference
  subnet_id              = var.subnet_id
  security_group_id      = azurerm_network_security_group.layer1.id

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = local.pn_options.os_disk_size
  }

  tags = local.default_tags
}

module "en" {
  count = local.en_options.count

  source = "../kaia-node"

  name                   = format("%s-en-%d", var.name, count.index + 1)
  resource_group_name    = var.resource_group_name
  instance_size          = local.en_options.instance_size
  public_key             = var.public_key
  source_image_reference = var.source_image_reference
  subnet_id              = var.subnet_id
  security_group_id      = azurerm_network_security_group.layer1.id

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = local.en_options.os_disk_size
  }

  tags = local.default_tags
}

module "monitor" {
  source = "../kaia-node"

  name                   = format("%s-monitor", var.name)
  resource_group_name    = var.resource_group_name
  instance_size          = local.monitor_options.instance_size
  public_key             = var.public_key
  source_image_reference = var.source_image_reference
  subnet_id              = var.subnet_id
  security_group_id      = azurerm_network_security_group.monitor.id

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = local.en_options.os_disk_size
  }

  tags = local.default_tags
}
