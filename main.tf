module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.2.2"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
}

resource "aws_key_pair" "imported" {
  count      = "${var.generate_ssh_key  == false ? 1 : 0}"
  key_name   = "${module.label.id}"
  public_key = "${file("${var.ssh_public_key_path}/${module.label.id}.pub")}"
}

resource "tls_private_key" "default" {
  count     = "${var.generate_ssh_key  == true ? 1 : 0}"
  algorithm = "${var.ssh_key_algorithm}"
}

resource "aws_key_pair" "generated" {
  count      = "${var.generate_ssh_key  == true ? 1 : 0}"
  depends_on = ["tls_private_key.default"]
  key_name   = "${module.label.id}"
  public_key = "${tls_private_key.default.public_key_openssh}"
}

resource "local_file" "public_key_openssh" {
  count      = "${var.generate_ssh_key  == true ? 1 : 0}"
  depends_on = ["tls_private_key.default"]
  content    = "${tls_private_key.default.public_key_openssh}"
  filename   = "${var.ssh_public_key_path}/${module.label.id}.pub"
}

resource "local_file" "private_key_pem" {
  count      = "${var.generate_ssh_key  == true ? 1 : 0}"
  depends_on = ["tls_private_key.default"]
  content    = "${tls_private_key.default.private_key_pem}"
  filename   = "${var.ssh_public_key_path}/${module.label.id}${var.private_key_extension}"
}

resource "null_resource" "chmod" {
  count      = "${var.generate_ssh_key  == true ? 1 : 0}"
  depends_on = ["local_file.private_key_pem"]

  provisioner "local-exec" {
    command = "chmod 600 ${var.ssh_public_key_path}/${module.label.id}${var.private_key_extension}"
  }
}
