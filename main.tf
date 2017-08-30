module "label" {
  source     = "git::https://github.com/cloudposse/tf_label.git?ref=tags/0.2.0"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
}

resource "aws_key_pair" "non_empty" {
  count      = "${var.generate_ssh_key  == false ? 1 : 0}"
  key_name   = "${module.label.id}"
  public_key = "${file("${var.ssh_public_key_path}/${module.label.id}.pub")}"
}

resource "tls_private_key" "default" {
  count     = "${var.generate_ssh_key  == true ? 1 : 0}"
  algorithm = "${var.ssh_key_algorithm}"
}

resource "aws_key_pair" "empty" {
  count      = "${var.generate_ssh_key  == true ? 1 : 0}"
  key_name   = "${module.label.id}"
  public_key = "${tls_private_key.default.public_key_openssh}"
}

resource "null_resource" "save_ssh_keys" {
  count      = "${var.generate_ssh_key  == true ? 1 : 0}"
  depends_on = ["tls_private_key.default"]

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.default.public_key_openssh}\" > ${var.ssh_public_key_path}/${module.label.id}.pub"
  }

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.default.private_key_pem}\" > ${var.ssh_public_key_path}/${module.label.id} && chmod 600 ${var.ssh_public_key_path}/${module.label.id}"
  }
}
