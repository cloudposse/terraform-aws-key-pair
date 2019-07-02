output "key_name" {
  value = compact(concat(
    aws_key_pair.imported.*.key_name,
    aws_key_pair.generated.*.key_name
  ))[0]

  description = "Name of SSH key"
}

output "public_key" {
  value       = join("", tls_private_key.default.*.public_key_openssh)
  description = "Content of the generated public key"
}

output "public_key_filename" {
  description = "Public Key Filename"
  value       = local.public_key_filename
}

output "private_key_filename" {
  description = "Private Key Filename"
  value       = local.private_key_filename
}
