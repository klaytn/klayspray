output "instance_link" {
  value = google_compute_instance.this.self_link
}

output "private_ip" {
  value = google_compute_instance.this.network_interface.0.network_ip
}

output "public_ip" {
  value = google_compute_instance.this.network_interface.0.access_config.0.nat_ip
}
