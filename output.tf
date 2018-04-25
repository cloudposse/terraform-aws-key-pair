output "key_name" {
  value = "${module.label.id}"
}

output "public_key" {
  value = "${join("", tls_private_key.default.*.public_key_openssh)}"
}
