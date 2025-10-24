variable "prefix" {
  description = "Prefix for bucket names"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key to use for bucket encryption"
  type        = string
}
