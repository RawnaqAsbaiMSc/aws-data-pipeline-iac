output "raw_bucket" {
  value = aws_s3_bucket.raw.bucket
}

output "processed_bucket" {
  value = aws_s3_bucket.processed.bucket
}

output "analytics_bucket" {
  value = aws_s3_bucket.analytics.bucket
}
