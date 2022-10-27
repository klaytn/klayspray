variable "name" {
  type        = string
  description = "Name of every resource's name tag"
}

variable "resource_group_name" {
  type        = string
  description = "Name of Azure Resource Group"
}

variable "instance_size" {
  type        = string
  description = "Instance type to be used creating instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to place instance"
}

variable "security_group_id" {
  type        = string
  description = "Security Group ID to attach to instance"
}

variable "public_key" {
  type        = string
  description = "A SSH public key to control login access to instance"
}

variable "os_disk" {
  type        = map(any)
  description = "OS disk to attach to instance"
  default     = {}
}

variable "data_disk" {
  type        = map(any)
  description = "Data disk to attach to instance"
  default     = {}
}

variable "source_image_reference" {
  type        = map(any)
  description = "Source image to be used creating instance"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags  to add to all resources"
  default     = {}
}
