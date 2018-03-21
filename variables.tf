variable "namespace" {}

variable "stage" {}

variable "name" {}

variable "delimiter" {
  default = "-"
}

variable "attributes" {
  type    = "list"
  default = []
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "ssh_public_key_path" {
  description = "Path to Read/Write SSH Public Key File (directory)"
}

variable "generate_ssh_key" {
  default = "false"
}

variable "ssh_key_algorithm" {
  default = "RSA"
}

variable "private_key_extension" {
  type    = "string"
  default = ""
}

variable "public_key_extension" {
  type    = "string"
  default = ".pub"
}

variable "operating_system" {
  type    = "string"
  default = "unix_like"
}