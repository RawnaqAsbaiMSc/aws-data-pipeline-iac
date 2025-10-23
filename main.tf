module "iam_lambda" {
  source     = "./modules/iam"
  role_name  = "lambda-etl-role"
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaBasicExecutionRole"
}

module "s3" {
  source = "./modules/s3"
  prefix = "my-pipeline"
}

module "observability" {
  source            = "./modules/observability"
  function_name     = "etl-transform"
  retention_in_days = 14
}
