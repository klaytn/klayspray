data "google_compute_zones" "this" {
}

data "google_compute_image" "this" {
  family  = "centos-7"
  project = "centos-cloud"
}
