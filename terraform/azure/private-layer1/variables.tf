variable "name" {
  type        = string
  description = "Name of every resource's name tag; if empty, auto-generated"
  default     = null
}

variable "resource_group_name" {
  type        = string
  description = "Name of Azure Resource Group"
}

variable "create_azure_key_pair" {
  type        = bool
  description = "Flag to create azure key pair or not"
  default     = true
}

variable "ssh_client_ips" {
  type        = list(string)
  description = "Whitelist IP CIDRs to be used to connect VM instances"
  default     = []
}

variable "cn_options" {
  type        = map(any)
  description = "The options to deploy CN nodes"
  default     = {}
}

variable "pn_options" {
  type        = map(any)
  description = "The options to deploy PN nodes"
  default     = {}
}

variable "en_options" {
  type        = map(any)
  description = "The options to deploy EN nodes"
  default     = {}
}

variable "monitor_options" {
  type        = map(any)
  description = "The options to deploy monitor nodes"
  default     = {}
}

variable "key_name" {
  type        = string
  description = "A key pair name used to control login access to VM instances; if empty, auto-generated"
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to add to all resources"
  default     = {}
}
