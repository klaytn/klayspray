output "ssh_private_key" {
  value = try(tls_private_key.this[0].private_key_openssh, null)
}

output "ssh_public_key" {
  value = try(data.tls_public_key.this.public_key_openssh, null)
}

output "ssh_private_key_path" {
  value = try(local_sensitive_file.this[0].filename, null)
}
