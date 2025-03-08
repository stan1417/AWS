resource "aws_lambda_function" "my_lambda_function" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "main.handler"
  runtime          = "python3.11"
  timeout          = 60
  memory_size      = 128

  filename         = data.archive_file.lambda_code.output_path
  source_code_hash = data.archive_file.lambda_code.output_base64sha256

  environment {
    variables = {
      "BUCKET_PATH" = "${var.bucket_name}/incoming/"
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = var.role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
