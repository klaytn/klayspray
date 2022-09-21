output "vpc_id" {
  description = "Created VPC's ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Created public subnets' IDs"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Created private subnets' IDs"
  value       = module.vpc.private_subnets
}

output "cn" {
  value = module.layer1.cn
}

output "pn" {
  value = module.layer1.pn
}

output "en" {
  value = module.layer1.en
}

output "monitor" {
  value = module.layer1.monitor
}
