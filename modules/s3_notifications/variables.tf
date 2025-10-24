# Bucket IDs for notification wiring
variable "raw_bucket_id" {
  type = string
}

variable "processed_bucket_id" {
  type = string
}

variable "analytics_bucket_id" {
  type = string
}

# Bucket ARNs for permission source_arn
variable "raw_bucket_arn" {
  type = string
}

variable "processed_bucket_arn" {
  type = string
}

variable "analytics_bucket_arn" {
  type = string
}

# Lambda names for permission
variable "ingest_lambda_name" {
  type = string
}

variable "transform_raw_lambda_name" {
  type = string
}

variable "transform_analytics_lambda_name" {
  type = string
}

# Lambda ARNs for notification targets
variable "ingest_lambda_arn" {
  type = string
}

variable "transform_raw_lambda_arn" {
  type = string
}

variable "transform_analytics_lambda_arn" {
  type = string
}
