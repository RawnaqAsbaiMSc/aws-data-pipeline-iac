resource "aws_lambda_function" "fetch_api_data" {
  function_name = "${var.prefix}-fetch-api"
  role          = var.lambda_role_arn
  runtime       = "python3.10"
  handler       = "lambda_function.lambda_handler"

  filename         = var.lambda_zip_path
  source_code_hash = filebase64sha256(var.lambda_zip_path)

  timeout     = 10
  memory_size = 128

  environment {
    variables = {
      API_ENDPOINT = var.api_endpoint
    }
  }
}
