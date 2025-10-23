
module "s3" {
  source      = "./modules/s3"
  prefix      = "my-pipeline"
  kms_key_arn = module.kms.kms_key_arn
}
module "kms" {
  source = "./modules/kms"
}
module "observability" {
  source            = "./modules/observability"
  function_name     = "etl-transform"
  retention_in_days = 14
}

module "iam" {
  source     = "./modules/iam"
  role_name  = "lambda-etl-role"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
module "lambda" {
  source           = "./modules/lambda"
  prefix           = var.prefix
  lambda_role_arn  = module.iam.lambda_role_arn
  lambda_zip_path  = "lambda/fetch_api.zip"
  api_endpoint     = var.api_endpoint
}
