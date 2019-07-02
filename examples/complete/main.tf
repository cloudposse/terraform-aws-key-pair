provider "aws" {
  region = var.region
}

module "aws_key_pair" {
  source              = "../../"
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  ssh_public_key_path = var.ssh_public_key_path
  generate_ssh_key    = var.generate_ssh_key
}
