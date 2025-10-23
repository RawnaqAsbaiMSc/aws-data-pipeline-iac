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

resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name                = "${var.prefix}-schedule"
  description         = "Triggers Lambda every hour"
  schedule_expression = "rate(1 hour)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_schedule.name
  target_id = "${var.prefix}-target"
  arn       = aws_lambda_function.fetch_api_data.arn
}


resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.fetch_api_data.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_schedule.arn
}
