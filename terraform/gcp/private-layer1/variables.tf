variable "name" {
  type        = string
  description = "Name of every resource's name tag; if empty, auto-generated"
  default     = null
}

variable "compute_disk" {
  type        = any
  description = "Config for additional compute disk"
  default     = null
}

variable "cn_options" {
  type        = any
  description = "The options to deploy CN nodes"
  default     = {}
}

variable "pn_options" {
  type        = any
  description = "The options to deploy PN nodes"
  default     = {}
}

variable "en_options" {
  type        = any
  description = "The options to deploy PN nodes"
  default     = {}
}

variable "monitor_options" {
  type        = any
  description = "The options to deploy monitor node"
  default     = {}
}

variable "metadata" {
  description = "A map of metadatas to add to all resources"
  default     = {}
}

variable "ssh_client_ips" {
  type        = list(any)
  description = "SSH ingress IP list"
  default     = []
}

variable "create_gcp_key_pair" {
  type        = bool
  description = "Controls if GCP key pair should be created"
  default     = true
}

variable "ssh_existing_private_key_path" {
  type        = string
  description = "Path where the private key is saved. It is only used when create_gcp_key_pair is false."
  default     = ""
}

variable "ssh_existing_public_key_path" {
  type        = string
  description = "Path where the public key is saved. It is only used when create_gcp_key_pair is false."
  default     = ""
}

variable "project" {
  type        = string
  description = "GCP project name"
  default     = null
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
  default     = null
}

variable "gcp_region" {
  type        = string
  description = "GCP region where all resources will be created"
  default     = "asia-northeast3"
}
