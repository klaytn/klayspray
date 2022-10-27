data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_network_security_group" "layer1" {
  name                = format("%s-private-layer1-sg", var.name)
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  dynamic "security_rule" {
    for_each = [
      { name = "ssh", priority = 100, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_ranges = ["22"], source_address_prefixes = var.ssh_client_ips, destination_address_prefix = "*" },
      { name = "rpc-tcp", priority = 101, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_ranges = ["8551", "32323", "32324"], source_address_prefix = "*", destination_address_prefix = "*" },
      { name = "rpc-udp", priority = 102, direction = "Inbound", access = "Allow", protocol = "Udp", source_port_range = "*", destination_port_ranges = ["32323"], source_address_prefix = "*", destination_address_prefix = "*" },
      { name = "brigde", priority = 103, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_ranges = ["50505"], source_address_prefix = "*", destination_address_prefix = "*" },
      { name = "monitor-internal", priority = 104, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_ranges = ["61001"], source_address_prefix = "VirtualNetwork", destination_address_prefix = "*" },
      { name = "egress", priority = 105, direction = "Outbound", access = "Allow", protocol = "*", source_port_range = "*", destination_port_range = "*", source_address_prefix = "*", destination_address_prefix = "*" },
    ]

    content {
      name                                       = security_rule.value.name
      priority                                   = security_rule.value.priority
      direction                                  = security_rule.value.direction
      access                                     = security_rule.value.access
      protocol                                   = security_rule.value.protocol
      source_port_range                          = try(security_rule.value.source_port_range, null)
      destination_port_range                     = try(security_rule.value.destination_port_range, null)
      source_port_ranges                         = try(security_rule.value.source_port_ranges, null)
      destination_port_ranges                    = try(security_rule.value.destination_port_ranges, null)
      source_address_prefix                      = try(security_rule.value.source_address_prefix, null)
      destination_address_prefix                 = try(security_rule.value.destination_address_prefix, null)
      source_address_prefixes                    = try(security_rule.value.source_address_prefixes, null)
      destination_address_prefixes               = try(security_rule.value.destination_address_prefixes, null)
      source_application_security_group_ids      = try(security_rule.value.source_application_security_group_ids, null)
      destination_application_security_group_ids = try(security_rule.destination_application_security_group_ids, null)
    }
  }
}

resource "azurerm_network_security_group" "monitor" {
  name                = format("%s-monitor-sg", var.name)
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  dynamic "security_rule" {
    for_each = [
      { name = "ssh", priority = 100, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_ranges = ["22"], source_address_prefixes = var.ssh_client_ips, destination_address_prefix = "*" },
      { name = "monitor", priority = 101, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_ranges = ["3000", "9090"], source_address_prefix = "*", destination_address_prefix = "*" },
      { name = "egress", priority = 102, direction = "Outbound", access = "Allow", protocol = "*", source_port_range = "*", destination_port_range = "*", source_address_prefix = "*", destination_address_prefix = "*" },
    ]

    content {
      name                         = security_rule.value.name
      priority                     = security_rule.value.priority
      direction                    = security_rule.value.direction
      access                       = security_rule.value.access
      protocol                     = security_rule.value.protocol
      source_port_range            = try(security_rule.value.source_port_range, null)
      destination_port_range       = try(security_rule.value.destination_port_range, null)
      source_port_ranges           = try(security_rule.value.source_port_ranges, null)
      destination_port_ranges      = try(security_rule.value.destination_port_ranges, null)
      source_address_prefix        = try(security_rule.value.source_address_prefix, null)
      destination_address_prefix   = try(security_rule.value.destination_address_prefix, null)
      source_address_prefixes      = try(security_rule.value.source_address_prefixes, null)
      destination_address_prefixes = try(security_rule.value.destination_address_prefixes, null)
    }
  }
}
