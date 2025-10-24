output "raw_trigger_bucket" {
  value = aws_s3_bucket_notification.raw_trigger.bucket
}

output "processed_trigger_bucket" {
  value = aws_s3_bucket_notification.processed_trigger.bucket
}

output "analytics_trigger_bucket" {
  value = aws_s3_bucket_notification.analytics_trigger.bucket
}
