variable "name" {
  type        = string
  description = "A key pair name"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "create_aws_key_pair" {
  type        = bool
  description = "Flag to create aws key pair or not "
  default     = true
}

variable "ssh_private_key_path" {
  type        = string
  description = "SSH private key path to save"
}
