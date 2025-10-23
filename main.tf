module "iam_lambda" {
  source     = "./modules/iam"
  role_name  = "lambda-etl-role"
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaBasicExecutionRole"
}



module "observability" {
  source            = "./modules/observability"
  function_name     = "etl-transform"
  retention_in_days = 14
}

module "kms" {
  source = "./modules/kms"
}

module "s3" {
  source      = "./modules/s3"
  prefix      = "my-pipeline"
  kms_key_arn = module.kms.kms_key_arn
}
