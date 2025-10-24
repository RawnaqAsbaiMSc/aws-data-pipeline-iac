resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  runtime          = var.runtime
  handler          = var.handler
  role             = var.lambda_role_arn
  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)
  description      = var.description
  publish          = true

  environment {
   variables = var.environment_variables
  }
}
