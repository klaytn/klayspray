data "google_compute_zones" "this" {
  region = var.gcp_region
}

data "google_compute_image" "this" {
  family  = "centos-stream-9"
  project = "centos-cloud"
}
