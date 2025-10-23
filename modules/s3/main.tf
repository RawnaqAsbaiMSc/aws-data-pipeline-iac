resource "aws_s3_bucket" "raw" {
  bucket = "${var.prefix}-raw-data"
}

resource "aws_s3_bucket" "processed" {
  bucket = "${var.prefix}-processed-data"
}

resource "aws_s3_bucket" "analytics" {
  bucket = "${var.prefix}-analytics-data"
}
