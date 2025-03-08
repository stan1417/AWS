module "lambda" {
  source = "../../modules/lambda"

  lambda_function_name = "my-lambda-function"
  role_name            = "my-lambda-role"
  bucket_name          = "my-s3-bucket"
  
}

module "iam" {
  source = "../../modules/iam"

  role_name      = "my-lambda-role"
  bucket_name    = "my-s3-bucket"

}

module "s3" {
  source = "../../modules/s3"

  bucket_name             = "my-s3-bucket"
  s3_prefix               = "incoming/"
  lambda_function_name    = module.lambda.lambda_function_name
  lambda_arn              = module.lambda.lambda_function_arn
  role_name               = "my-lambda-role"

}
