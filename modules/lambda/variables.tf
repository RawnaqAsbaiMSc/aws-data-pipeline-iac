variable "prefix" {
  description = "Prefix for naming the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda execution"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the zipped Lambda code"
  type        = string
}

variable "api_endpoint" {
  description = "External API endpoint to fetch data from"
  type        = string
}
