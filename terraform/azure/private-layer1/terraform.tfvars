name                = "Klayspray"
resource_group_name = "Klayspray"
ssh_client_ips      = ["0.0.0.0/0"]

cn_options = {
  count         = 4
  instance_size = "Standard_D2_v5"
  os_disk_size  = 100
}

pn_options = {
  count         = 4
  instance_size = "Standard_D2_v5"
  os_disk_size  = 100
}

en_options = {
  count         = 4
  instance_size = "Standard_D2_v5"
  os_disk_size  = 100
}

monitor_options = {
  count         = 4
  instance_size = "Standard_B2s"
  os_disk_size  = 100
}
