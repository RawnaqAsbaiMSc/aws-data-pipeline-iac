variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "retention_in_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 14
}
