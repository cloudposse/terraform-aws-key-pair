output "key_name" {
  value = "${element(compact(concat(aws_key_pair.imported.*.key_name, aws_key_pair.generated.*.key_name)), 0)}"
}
