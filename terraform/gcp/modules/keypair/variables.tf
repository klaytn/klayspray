variable "name" {
  type        = string
  description = "A key pair name"
}

variable "tags" {
  type        = any
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "create_gcp_key_pair" {
  type        = bool
  description = "Controls if GCP key pair should be created"
  default     = true
}

variable "ssh_private_key_path" {
  type        = string
  description = "Path where the generated private key will be saved when create_gcp_key_pair is true"
  default     = ""
}

variable "ssh_existing_private_key_path" {
  type        = string
  description = "Path where the private key is saved. It is only used when create_gcp_key_pair is false"
  default     = ""
}

variable "ssh_existing_public_key_path" {
  type        = string
  description = "Path where the public key is saved. It is only used when create_gcp_key_pair is false"
  default     = ""
}
