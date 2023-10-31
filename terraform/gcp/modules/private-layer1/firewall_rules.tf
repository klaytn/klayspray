locals {
  firewall_rules = [
    {
      name        = "ssh"
      direction   = "INGRESS"
      ranges      = var.ssh_client_ips
      target_tags = ["klayspray"]
      allow = {
        protocol = "tcp"
        ports    = ["22"]
      }
    },
    {
      name        = "rpc-tcp"
      direction   = "INGRESS"
      ranges      = ["0.0.0.0/0"]
      source_tags = ["cn", "pn", "en"]
      target_tags = ["cn", "pn", "en"]
      allow = {
        protocol = "tcp"
        ports    = ["8551", "32323-32324"]
      }
    },
    {
      name        = "rpc-udp"
      direction   = "INGRESS"
      ranges      = ["0.0.0.0/0"]
      source_tags = ["cn", "pn", "en"]
      target_tags = ["cn", "pn", "en"]
      allow = {
        protocol = "udp"
        ports    = ["32323"]
      }
    },
    {
      name        = "monitor-internal"
      direction   = "INGRESS"
      source_tags = ["monitor"]
      target_tags = ["cn", "pn", "en"]
      allow = {
        protocol = "tcp"
        ports    = ["61001"]
      }
    },
    {
      name        = "monitor-external"
      direction   = "INGRESS"
      ranges      = ["0.0.0.0/0"]
      target_tags = ["monitor"]
      allow = {
        protocol = "tcp"
        ports    = ["3000", "9090"]
      }
    },
    {
      name        = "egress-tcp"
      direction   = "EGRESS"
      ranges      = ["0.0.0.0/0"]
      target_tags = ["klayspray"]
      allow = {
        protocol = "tcp"
        ports    = ["0-65535"]
      }
    },
    {
      name        = "egress-udp"
      direction   = "EGRESS"
      ranges      = ["0.0.0.0/0"]
      target_tags = ["klayspray"]
      allow = {
        protocol = "udp"
        ports    = ["0-65535"]
      }
    },
  ]
}

module "firewall_rules" {
  for_each = { for v in local.firewall_rules : v.name => v }

  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = var.network

  rules = [{
    name                    = try(each.value.name, "rule")
    description             = try(each.value.description, null)
    direction               = try(each.value.direction, "INGRESS") # INGRESS OR EGRESS
    priority                = try(each.value.priority, null)
    ranges                  = try(each.value.ranges, null) # []
    source_tags             = try(each.value.source_tags, null)
    source_service_accounts = try(each.value.source_service_accounts, null)
    target_tags             = try(each.value.target_tags, null)
    target_service_accounts = try(each.value.target_service_accounts, null)

    allow = [{
      protocol = try(each.value.allow.protocol, "tcp")
      ports    = try(each.value.allow.ports, null) # []
    }]

    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
