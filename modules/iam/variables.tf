variable "prefix" {
  description = "Project prefix used for naming resources"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN used for S3 encryption"
  type        = string
}

variable "basic_policy_arn" {
  description = "ARN of AWSLambdaBasicExecutionRole managed policy"
  type        = string
}

variable "raw_bucket_arn" {
  description = "ARN of the raw S3 bucket for ingestion"
  type        = string
}