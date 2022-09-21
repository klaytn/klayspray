output "key_name" {
  value = try(aws_key_pair.this[0].key_name, data.aws_key_pair.this[0].key_name)
}

output "ssh_private_key_path" {
  value = try(local_sensitive_file.this[0].filename, null)
}
