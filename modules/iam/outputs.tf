
output "ingest_lambda_role_arn" {
  value = aws_iam_role.ingest_lambda_role.arn
}

output "transform_raw_lambda_role_arn" {
  value = aws_iam_role.transform_raw_role.arn
}

output "transform_analytics_lambda_role_arn" {
  value = aws_iam_role.transform_analytics_role.arn
}

output "db_ingest_lambda_role_arn" {
  description = "IAM role ARN for the DB ingestion Lambda"
  value       = aws_iam_role.db_ingest_lambda_role.arn
}
