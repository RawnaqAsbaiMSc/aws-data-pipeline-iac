# KMS
module "kms" {
  source = "./modules/kms"
}

# IAM 
module "iam" {
  source           = "./modules/iam"
  prefix           = var.prefix
  kms_key_arn      = module.kms.kms_key_arn
  basic_policy_arn = var.basic_policy_arn
}

# Lambda Functions 
module "ingest_lambda" {
  source          = "./modules/lambda"
  function_name   = "${var.prefix}-ingest-data"
  filename        = "${path.module}/lambda/ingest_data.zip"
  handler         = "lambda_function.lambda_handler"
  lambda_role_arn = module.iam.ingest_lambda_role_arn
}

module "transform_raw_lambda" {
  source          = "./modules/lambda"
  function_name   = "${var.prefix}-transform-raw-to-processed"
  filename        = "${path.module}/lambda/transform_raw_to_processed.zip"
  handler         = "lambda_function.lambda_handler"
  lambda_role_arn = module.iam.transform_raw_lambda_role_arn
}

module "transform_analytics_lambda" {
  source          = "./modules/lambda"
  function_name   = "${var.prefix}-transform-processed-to-analytics"
  filename        = "${path.module}/lambda/transform_processed_to_analytics.zip"
  handler         = "lambda_function.lambda_handler"
  lambda_role_arn = module.iam.transform_analytics_lambda_role_arn
}

# S3 Buckets 
module "s3" {
  source      = "./modules/s3"
  prefix      = var.prefix
  kms_key_arn = module.kms.kms_key_arn
}

# S3 Notifications + Lambda Permissions
module "s3_notifications" {
  source = "./modules/s3_notifications"

  raw_bucket_id       = module.s3.raw_bucket_id
  processed_bucket_id = module.s3.processed_bucket_id
  analytics_bucket_id = module.s3.analytics_bucket_id

  raw_bucket_arn       = module.s3.raw_bucket_arn
  processed_bucket_arn = module.s3.processed_bucket_arn
  analytics_bucket_arn = module.s3.analytics_bucket_arn

  ingest_lambda_arn              = module.ingest_lambda.lambda_arn
  transform_raw_lambda_arn       = module.transform_raw_lambda.lambda_arn
  transform_analytics_lambda_arn = module.transform_analytics_lambda.lambda_arn

  ingest_lambda_name              = module.ingest_lambda.lambda_name
  transform_raw_lambda_name       = module.transform_raw_lambda.lambda_name
  transform_analytics_lambda_name = module.transform_analytics_lambda.lambda_name
}
