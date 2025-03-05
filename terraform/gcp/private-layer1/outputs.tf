output "layer1" {
  value       = module.layer1
  description = "Layer 1 module output"
  sensitive   = true
}

output "project_region" {
  value       = var.create_gcp_key_pair ? var.gcp_region : null
  description = "GCP region"
  sensitive   = false
}

output "project_id" {
  value       = var.create_gcp_key_pair ? var.project_id : null
  description = "GCP project ID"
  sensitive   = false
}
