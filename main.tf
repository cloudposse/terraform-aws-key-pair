module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.17.0"
  namespace   = var.namespace
  stage       = var.stage
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  delimiter   = var.delimiter
  tags        = var.tags
}

locals {
  public_key_filename = format(
    "%s/%s",
    var.ssh_public_key_path,
    coalesce(var.ssh_public_key_file, join("", [module.label.id, var.public_key_extension]))
  )

  private_key_filename = format(
    "%s/%s%s",
    var.ssh_public_key_path,
    module.label.id,
    var.private_key_extension
  )
}

resource "aws_key_pair" "imported" {
  count      = var.generate_ssh_key == false ? 1 : 0
  key_name   = module.label.id
  public_key = file(local.public_key_filename)
}

resource "tls_private_key" "default" {
  count     = var.generate_ssh_key == true ? 1 : 0
  algorithm = var.ssh_key_algorithm
}

resource "aws_key_pair" "generated" {
  count      = var.generate_ssh_key == true ? 1 : 0
  depends_on = [tls_private_key.default]
  key_name   = module.label.id
  public_key = tls_private_key.default[0].public_key_openssh
}

resource "local_file" "public_key_openssh" {
  count      = var.generate_ssh_key == true ? 1 : 0
  depends_on = [tls_private_key.default]
  content    = tls_private_key.default[0].public_key_openssh
  filename   = local.public_key_filename
}

resource "local_file" "private_key_pem" {
  count             = var.generate_ssh_key == true ? 1 : 0
  depends_on        = [tls_private_key.default]
  sensitive_content = tls_private_key.default[0].private_key_pem
  filename          = local.private_key_filename
  file_permission   = "0600"
}
