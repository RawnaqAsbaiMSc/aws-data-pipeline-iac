output "raw_bucket_id" {
  value = aws_s3_bucket.raw.id
}

output "processed_bucket_id" {
  value = aws_s3_bucket.processed.id
}

output "analytics_bucket_id" {
  value = aws_s3_bucket.analytics.id
}

output "raw_bucket_arn" {
  value = aws_s3_bucket.raw.arn
}

output "processed_bucket_arn" {
  value = aws_s3_bucket.processed.arn
}

output "analytics_bucket_arn" {
  value = aws_s3_bucket.analytics.arn
}
