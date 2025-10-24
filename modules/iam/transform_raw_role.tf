resource "aws_iam_role" "transform_raw_role" {
  name = "${var.prefix}-transform-raw-role"

  assume_role_policy = aws_iam_role.ingest_lambda_role.assume_role_policy
}

resource "aws_iam_policy" "transform_raw_s3_policy" {
  name        = "${var.prefix}-transform-raw-s3-policy"
  description = "Allow transform_raw Lambda to write to processed bucket and use KMS"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect: "Allow",
        Action: ["s3:PutObject"],
        Resource: "arn:aws:s3:::${var.prefix}-processed-data/*"
      },
      {
        Effect: "Allow",
        Action: ["kms:Encrypt", "kms:Decrypt", "kms:GenerateDataKey"],
        Resource: var.kms_key_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "transform_raw_attach" {
  role       = aws_iam_role.transform_raw_role.name
  policy_arn = aws_iam_policy.transform_raw_s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "transform_raw_basic" {
  role       = aws_iam_role.transform_raw_role.name
  policy_arn = var.basic_policy_arn
}
