variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key directory (e.g. `/secrets`)"
}

variable "ssh_public_key_file" {
  type        = string
  description = "Name of existing SSH public key file (e.g. `id_rsa.pub`)"
  default     = null
}

variable "generate_ssh_key" {
  type        = bool
  default     = false
  description = "If set to `true`, new SSH key pair will be created and `ssh_public_key_file` will be ignored"
}

variable "ssh_key_algorithm" {
  type        = string
  default     = "RSA"
  description = "SSH key algorithm"
}

variable "private_key_extension" {
  type        = string
  default     = ""
  description = "Private key extension"
}

variable "public_key_extension" {
  type        = string
  default     = ".pub"
  description = "Public key extension"
}

variable "ssm_parameter_enabled" {
  type        = bool
  default     = false
  description = "Whether an SSM parameter store value is created to store the key's private key pem."
}

variable "ssm_parameter_path_prefix" {
  type        = string
  default     = "/ec2/key-pairs/"
  description = "The path prefix for the created SSM parameter e.g. '/ec2/key-pairs/acme-ue1-dev-bastion'. `ssm_parameter_enabled` must be set to `true` for this to take affect."
}