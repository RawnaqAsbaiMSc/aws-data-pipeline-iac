
output "ingest_lambda_role_arn" {
  value = aws_iam_role.ingest_lambda_role.arn
}

output "transform_raw_lambda_role_arn" {
  value = aws_iam_role.transform_raw_role.arn
}

output "transform_analytics_lambda_role_arn" {
  value = aws_iam_role.transform_analytics_role.arn
}
