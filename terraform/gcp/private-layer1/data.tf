data "google_compute_zones" "this" {
  region = var.gcp_region
}

data "google_compute_image" "this" {
  family  = "rocky-linux-9"
  project = "rocky-linux-cloud"
}
