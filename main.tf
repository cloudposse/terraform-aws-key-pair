<<<<<<< HEAD
data "template_file" "default" {
  template = "${file("${var.ssh_public_key_path}/${module.label.id}.pub")}"
}

module "label" {
  source     = "git::https://github.com/cloudposse/tf_label.git?ref=tags/0.2.0"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
}

resource "aws_key_pair" "default" {
  key_name   = "${module.label.id}"
  public_key = "${data.template_file.default.rendered}"
=======
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
  count      = "${signum(length(var.ssh_public_key_path)) == 1 ? 1 : 0}"
  key_name   = "${module.label.id}"
  public_key = "${file("${var.ssh_public_key_path}")}"
}

resource "tls_private_key" "default" {
  count     = "${signum(length(var.ssh_public_key_path)) == 0 ? 1 : 0}"
  algorithm = "${var.ssh_key_algorithm}"
}

resource "aws_key_pair" "empty" {
  count      = "${signum(length(var.ssh_public_key_path)) == 0 ? 1 : 0}"
  key_name   = "${module.label.id}"
  public_key = "${tls_private_key.default.public_key_openssh}"
}

<<<<<<< HEAD
resource "aws_key_pair" "empty_public_key" {
  count      = "${signum(length(var.ssh_public_key)) == 0 ? 1 : 0}"
  key_name   = "${var.ssh_public_key_name}"
  public_key = "${file("${var.ssh_key_path}/${module.label.namespace}-${module.label.stage}-${module.label.name}.pub")}"
>>>>>>> added code
=======
resource "null_resource" "save_ssh_keys" {
  count      = "${signum(length(var.ssh_public_key_path)) == 0 ? 1 : 0}"
  depends_on = ["tls_private_key.default"]

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.default.public_key_openssh}\" > ${path.module}/ssh_key.pub && chmod 600 ${path.module}/ssh_key.pub"
  }

  provisioner "local-exec" {
    command = "echo \"${tls_private_key.default.private_key_pem}\" > ${path.module}/ssh_key"
  }
>>>>>>> reworked
}
