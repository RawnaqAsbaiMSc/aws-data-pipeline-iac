resource "aws_kms_key" "data_key" {
  description             = "KMS key for encrypting pipeline data"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}
