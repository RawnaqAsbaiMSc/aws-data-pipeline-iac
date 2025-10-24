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
