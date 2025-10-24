resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  filename         = var.filename
  handler          = var.handler
  role             = var.lambda_role_arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256(var.filename)
}


