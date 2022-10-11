module "vpc" {
  source = "terraform-google-modules/network/google"

  project_id   = var.project_id
  network_name = local.name

  subnets = [
    {
      subnet_name   = format("%s-public-subnet", local.name)
      subnet_ip     = "10.1.101.0/24"
      subnet_region = var.gcp_region
    },
    {
      subnet_name           = format("%s-private-subnet", local.name)
      subnet_ip             = "10.1.1.0/24"
      subnet_region         = var.gcp_region
      subnet_private_access = "true"
    },
  ]

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
}
