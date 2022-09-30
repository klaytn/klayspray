variable "name" {
  type        = string
  description = "Name of every resource's name tag; if empty, auto-generated"
  default     = null
}

variable "network" {
  type        = string
  description = "Network Name to be used"
  default     = ""
}

variable "subnetwork" {
  type        = string
  description = "Subnet Network Name to be used"
  default     = ""
}

variable "zone_list" {
  type        = list(any)
  description = "Available zone lists for selected region"
  default     = []
}

variable "boot_image_id" {
  type        = string
  description = "OS boot image ID"
  default     = "centos-7"
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

variable "ssh_client_ips" {
  type        = list(any)
  description = "SSH ingress IP list"
  default     = []
}

variable "metadata" {
  type        = map(any)
  description = "Metadata array"
}
