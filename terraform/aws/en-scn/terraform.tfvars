aws_region     = "ap-northeast-2"
ssh_client_ips = ["0.0.0.0/0"]

en_options = {
  count           = 1
  instance_type   = "c5.large"
  ebs_volume_size = 1000
}

scn_options = {
  count           = 4
  instance_type   = "t3.small"
  ebs_volume_size = 20
}
