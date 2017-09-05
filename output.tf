output "key_name" {
  value = "${aws_key_pair.non_empty.key_name}"
}

output "key_name_generated" {
  value = "${aws_key_pair.empty.key_name}"
}
