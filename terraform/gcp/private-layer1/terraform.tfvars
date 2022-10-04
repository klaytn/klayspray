project    = "klayspray"
project_id = "klayspray-123456"
gcp_region = "asia-northeast3"

name           = "klayspray"
ssh_client_ips = ["0.0.0.0/0"]

cn_options = {
  count          = 4
  machine_type   = "e2-medium"
  boot_disk_size = 30
  # compute_disk_size = 100
}

pn_options = {
  count          = 4
  machine_type   = "e2-medium"
  boot_disk_size = 30
  # compute_disk_size = 100
}

en_options = {
  count          = 1
  machine_type   = "e2-medium"
  boot_disk_size = 30
  # compute_disk_size = 100
}

monitor_options = {
  machine_type   = "e2-medium"
  boot_disk_size = 30
  # compute_disk_size = 100
}
