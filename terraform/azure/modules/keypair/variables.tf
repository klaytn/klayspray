variable "name" {
  type        = string
  description = "A key pair name"
}

variable "create_azure_key_pair" {
  type        = bool
  description = "Flag to create azure key pair or not"
  default     = true
}

variable "ssh_private_key_path" {
  type        = string
  description = "SSH private key path to save"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group to deploy"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to add to all resources"
  default     = {}
}
