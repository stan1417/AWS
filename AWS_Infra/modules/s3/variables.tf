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

variable "s3_prefix" {
  type        = string
  description = "The S3 object prefix to filter on"
}

variable "lambda_arn" {
  type        = string
  description = "The ARN of the Lambda function"
}