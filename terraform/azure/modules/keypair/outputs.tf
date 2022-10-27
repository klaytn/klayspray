output "key_name" {
  value = try(azurerm_ssh_public_key.this[0].name, data.azurerm_ssh_public_key.this[0].name)
}

output "ssh_private_key_path" {
  value = try(local_sensitive_file.this[0].filename, null)
}

output "ssh_public_key" {
  value = try(azurerm_ssh_public_key.this[0].public_key)
}
