output "key_name" {
  value = compact(concat(
    aws_key_pair.imported.*.key_name,
    aws_key_pair.generated.*.key_name
  ))[0]

  description = "Name of SSH key"
}

output "public_key" {
  value       = coalesce(join("", aws_key_pair.imported.*.public_key), join("", tls_private_key.default.*.public_key_openssh))
  description = "Content of the generated public key"
}

output "private_key" {
  sensitive   = true
  description = "Content of the generated private key"
  value       = join("", tls_private_key.default.*.private_key_pem)
}

output "public_key_filename" {
  description = "Public Key Filename"

  # Prevent releasing filename to downstream consumers until file exists (aka not during plan):
  value = length(join("", tls_private_key.default.*.public_key_openssh)) > 0 ? local.public_key_filename : local.public_key_filename
}

output "private_key_filename" {
  description = "Private Key Filename"

  # Prevent releasing filename to downstream consumers until file exists (aka not during plan):
  value = length(join("", tls_private_key.default.*.public_key_openssh)) > 0 ? local.private_key_filename : local.private_key_filename
}
