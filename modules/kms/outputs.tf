output "kms_key_arn" {
  description = "ARN of the KMS key"
  value       = aws_kms_key.data_key.arn
}
