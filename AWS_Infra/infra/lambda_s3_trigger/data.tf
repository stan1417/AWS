data "archive_file" "lambda_code" {
  type        = "zip"
  source_dir  = "../lambda_functions/"
  output_path = "${path.module}/lambda_code.zip"
}

