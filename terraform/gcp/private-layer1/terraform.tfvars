project    = "klayspray"
project_id = "klayspray-123456"
gcp_region = "asia-northeast3"

name           = "klayspray"
username       = "kaia"
ssh_client_ips = ["0.0.0.0/0"]


deploy_options = {
  kaia_network_id = 9999
  kaia_chain_id   = 9999
  kaia_rewardbase = "0x46879cdc21832d6bd6b49081513fa3d965443075"
}

cn_options = {
  count          = 1
  machine_type   = "n2-standard-2"
  boot_disk_size = 30
  # compute_disk_size = 100
}

pn_options = {
  count          = 1
  machine_type   = "n2-standard-2"
  boot_disk_size = 30
  # compute_disk_size = 100
}

en_options = {
  count          = 1
  machine_type   = "n2-standard-2"
  boot_disk_size = 30
  # compute_disk_size = 100
}

monitor_options = {
  machine_type   = "n2-standard-2"
  boot_disk_size = 30
  # compute_disk_size = 100
}
