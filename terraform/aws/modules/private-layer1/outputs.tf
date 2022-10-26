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
  value = one(module.monitor)
}

output "layer1_sg_id" {
  value = aws_security_group.layer1.id
}

output "monitor_sg_id" {
  value = aws_security_group.monitor.id
}
