output "key_pair_name" {
  value = var.name
}

output "ssh_public_key" {
  value = local.public_key
}

output "ssh_private_key_path" {
  value = local.private_key_path
}
