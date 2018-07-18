output "key_name" {
  value       = "${element(compact(concat(aws_key_pair.imported.*.key_name, aws_key_pair.generated.*.key_name)), 0)}"
  description = "Name of SSH key"
}

output "public_key" {
  value       = "${join("", tls_private_key.default.*.public_key_openssh)}"
  description = "Contents of the generated public key"
}
