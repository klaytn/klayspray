data "google_compute_zones" "this" {
  region = var.gcp_region
}

data "google_compute_image" "this" {
<<<<<<< HEAD
  family  = "centos-stream-9"
  project = "centos-cloud"
=======
  family  = "rocky-linux-9"
  project = "rocky-linux-cloud"
>>>>>>> d2097a0 (update kaia version)
}
