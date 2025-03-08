resource "aws_iam_policy" "s3_bucket_policy" {
  name        = "s3-bucket-policy"
  description = "Allows read and write access to S3 buckets"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::${var.bucket_name}/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": "arn:aws:s3:::${var.bucket_name}"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy_attachment" {
  role       = var.role_name
  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}
