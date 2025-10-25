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

#Ingestion Lambda variables
variable "db_type" {
  description = "Database type (e.g., postgresql, mysql)"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_query" {
  description = "SQL query to run"
  type        = string
}

variable "raw_bucket_name" {
  description = "Name of the raw S3 bucket"
  type        = string
}
