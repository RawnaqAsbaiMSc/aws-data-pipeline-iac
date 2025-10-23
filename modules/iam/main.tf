resource "aws_iam_role" "lambda_etl_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_etl_role.name
  policy_arn = var.policy_arn
}

resource "aws_iam_policy" "lambda_s3_write" {
  name        = "${var.prefix}-lambda-s3-write"
  description = "Allow Lambda to write weather logs to S3"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject"],
        Resource = "arn:aws:s3:::${var.prefix}-weather-logs/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3_write_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_s3_write.arn
}

