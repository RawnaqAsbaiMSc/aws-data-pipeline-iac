variable "prefix" {
  description = "Project prefix used for naming resources"
  type        = string
}

variable "region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "us-east-1"
}

variable "basic_policy_arn" {
  description = "ARN of AWSLambdaBasicExecutionRole managed policy"
  type        = string
}

variable "processed_bucket_name" {
  description = "Name of the processed S3 bucket"
  type        = string
}

variable "analytics_bucket_name" {
  description = "Name of the analytics S3 bucket"
  type        = string
}
