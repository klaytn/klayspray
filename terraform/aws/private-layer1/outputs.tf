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
