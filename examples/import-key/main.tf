provider "aws" {
  region = var.region
}

module "aws_key_pair" {
  source  = "../../"

  ssh_public_key_path = var.ssh_public_key_path
  ssh_public_key_file = var.ssh_public_key_file
  generate_ssh_key    = var.generate_ssh_key

  context = module.this.context
}
