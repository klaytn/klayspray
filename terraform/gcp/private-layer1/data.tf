data "google_compute_zones" "this" {
}

data "google_compute_image" "this" {
  family  = "centos-stream-9"
  project = "centos-cloud"
}
