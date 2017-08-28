output "generated_public_ssh_key" {
  value = ["${file("${var.ssh_key_path}/${module.label.namespace}-${module.label.stage}-${module.label.name}.pub") != ""}"]
}

output "generated_private_ssh_key" {
  value = ["${file("${var.ssh_key_path}/${module.label.namespace}-${module.label.stage}-${module.label.name}") != ""}"]
}
