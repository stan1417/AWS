variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function"
}

variable "role_name" {
  type        = string
  description = "The name of the IAM role for Lambda"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}