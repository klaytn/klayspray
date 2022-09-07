aws_region     = "ap-northeast-2"
ssh_client_ips = ["0.0.0.0/0"]

cn_options = {
  count           = 4
  instance_type   = "t3.small"
  ebs_volume_size = 20
}

pn_options = {
  count           = 4
  instance_type   = "t3.small"
  ebs_volume_size = 20
}

en_options = {
  count           = 1
  instance_type   = "t3.small"
  ebs_volume_size = 20
}

monitor_options = {
  instance_type   = "t3.small"
  ebs_volume_size = 20
}
