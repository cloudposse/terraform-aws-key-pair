<<<<<<< HEAD
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
=======
variable "namespace" {
  default = ""
}

variable "stage" {
  default = ""
}

variable "name" {
  default = ""
}

variable "ssh_public_key" {
  default = ""
}

variable "ssh_key_path" {
  default = ""
}

variable "ssh_public_key_name" {
  default = ""
>>>>>>> added code
}
