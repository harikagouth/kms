output "arn" {
  value = aws_kms_key.this.arn
}

output "id" {
  value = aws_kms_key.this.id
}

output "name" {
  value = aws_kms_alias.this.name
}