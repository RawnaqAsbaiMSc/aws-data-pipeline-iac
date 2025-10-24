# Lambda permissions
resource "aws_lambda_permission" "ingest" {
  statement_id  = "AllowExecutionFromS3Ingest"
  action        = "lambda:InvokeFunction"
  function_name = var.ingest_lambda_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.raw_bucket_arn
}

resource "aws_lambda_permission" "transform_raw" {
  statement_id  = "AllowExecutionFromS3TransformRaw"
  action        = "lambda:InvokeFunction"
  function_name = var.transform_raw_lambda_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.processed_bucket_arn
}

resource "aws_lambda_permission" "transform_analytics" {
  statement_id  = "AllowExecutionFromS3TransformAnalytics"
  action        = "lambda:InvokeFunction"
  function_name = var.transform_analytics_lambda_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.analytics_bucket_arn
}

# S3 triggers
resource "aws_s3_bucket_notification" "raw_trigger" {
  bucket = var.raw_bucket_id

  lambda_function {
    lambda_function_arn = var.ingest_lambda_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.ingest]
}

resource "aws_s3_bucket_notification" "processed_trigger" {
  bucket = var.processed_bucket_id

  lambda_function {
    lambda_function_arn = var.transform_raw_lambda_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.transform_raw]
}

resource "aws_s3_bucket_notification" "analytics_trigger" {
  bucket = var.analytics_bucket_id

  lambda_function {
    lambda_function_arn = var.transform_analytics_lambda_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.transform_analytics]
}
