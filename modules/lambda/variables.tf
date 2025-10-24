variable "function_name" {
  type = string
}

variable "filename" {
  type = string
}

variable "handler" {
  type = string
}

variable "lambda_role_arn" {
  type = string
}

variable "runtime" {
  type    = string
  default = "python3.12"
}

variable "description" {
  type    = string
  default = ""
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}
