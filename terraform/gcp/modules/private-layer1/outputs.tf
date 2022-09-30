output "cn" {
  value = module.cn
}

output "pn" {
  value = module.pn
}

output "en" {
  value = module.en
}

output "monitor" {
  value = module.monitor
}

output "firewall_rules" {
  value = { for k, v in module.firewall_rules : k => v.firewall_rules }
}
