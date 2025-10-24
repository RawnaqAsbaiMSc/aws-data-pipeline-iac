module "kms" {
  source = "./modules/kms"
}

module "s3" {
  source      = "./modules/s3"
  prefix      = var.prefix
  kms_key_arn = module.kms.kms_key_arn
}

module "iam" {
  source           = "./modules/iam"
  prefix           = var.prefix
  kms_key_arn      = module.kms.kms_key_arn
  basic_policy_arn = var.basic_policy_arn
}

module "ingest_lambda" {
  source          = "./modules/lambda"
  function_name   = "${var.prefix}-ingest-data"
  filename        = "${path.module}/artifacts/ingest_data.zip"
  handler         = "lambda_function.lambda_handler"
  lambda_role_arn = module.iam.ingest_lambda_role_arn
}

module "transform_raw_lambda" {
  source          = "./modules/lambda"
  function_name   = "${var.prefix}-transform-raw-to-processed"
  filename        = "${path.module}/artifacts/transform_raw_to_processed.zip"
  handler         = "lambda_function.lambda_handler"
  lambda_role_arn = module.iam.transform_raw_lambda_role_arn
}

module "transform_analytics_lambda" {
  source          = "./modules/lambda"
  function_name   = "${var.prefix}-transform-processed-to-analytics"
  filename        = "${path.module}/artifacts/transform_processed_to_analytics.zip"
  handler         = "lambda_function.lambda_handler"
  lambda_role_arn = module.iam.transform_analytics_lambda_role_arn
}
