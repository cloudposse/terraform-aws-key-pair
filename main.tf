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
  source    = "git::https://github.com/cloudposse/tf_label.git?ref=tags/0.2.0"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}

resource "aws_key_pair" "not_empty_public_key" {
  count      = "${signum(length(var.ssh_public_key)) == 1 ? 1 : 0}"
  key_name   = "${var.ssh_public_key_name}"
  public_key = "${var.ssh_public_key}"
}

resource "null_resource" "generate1" {
  provisioner "local-exec" {
    command = "ssh-keygen -b 2048 -f ${var.ssh_key_path}/${module.label.namespace}-${module.label.stage}-${module.label.name} -N '' "
  }

  //  triggers {
  //    count = "${signum(length(var.ssh_public_key)) == 1 ? 1 : 0}"
  //  }
}

resource "aws_key_pair" "empty_public_key" {
  count      = "${signum(length(var.ssh_public_key)) == 0 ? 1 : 0}"
  key_name   = "${var.ssh_public_key_name}"
  public_key = "${file("${var.ssh_key_path}/${module.label.namespace}-${module.label.stage}-${module.label.name}.pub")}"
>>>>>>> added code
}
