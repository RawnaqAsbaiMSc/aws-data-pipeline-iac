resource "aws_iam_role" "ingest_lambda_role" {
  name = "${var.prefix}-ingest-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "ingest_s3_policy" {
  name        = "${var.prefix}-ingest-s3-policy"
  description = "Allow ingest Lambda to write to raw bucket and use KMS"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect: "Allow",
        Action: ["s3:PutObject"],
        Resource: "arn:aws:s3:::${var.prefix}-raw-data/*"
      },
      {
        Effect: "Allow",
        Action: ["kms:Encrypt", "kms:Decrypt", "kms:GenerateDataKey"],
        Resource: var.kms_key_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ingest_attach" {
  role       = aws_iam_role.ingest_lambda_role.name
  policy_arn = aws_iam_policy.ingest_s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "ingest_basic" {
  role       = aws_iam_role.ingest_lambda_role.name
  policy_arn = var.basic_policy_arn
}
