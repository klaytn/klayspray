terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.38.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}

provider "tls" {}
