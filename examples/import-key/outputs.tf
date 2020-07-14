output "key_name" {
  value       = module.aws_key_pair.key_name
  description = "Name of SSH key"
}

output "public_key" {
  value       = module.aws_key_pair.public_key
  description = "Content of the imported public key"
}

output "public_key_filename" {
  description = "Public Key Filename"
  value       = module.aws_key_pair.public_key_filename
}

output "private_key_filename" {
  description = "Private Key Filename"
  value       = module.aws_key_pair.private_key_filename
}
