variable "name" {
  type        = string
  description = "Name of every resource's name tag"
  default     = null
}

variable "resource_group_name" {
  type        = string
  description = "Name of Azure Resource Group"
}

variable "source_image_reference" {
  type        = map(any)
  description = "Source image to be used creating instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to place instance"
}

variable "public_key" {
  type        = string
  description = "A SSH public key to control login access to instance"
}

variable "ssh_client_ips" {
  type        = list(string)
  description = "Whitelist IP CIDRs to be used to connect EC2 instances"
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to add to all resources"
  default     = {}
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
