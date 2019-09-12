/*
   Lambda function resources
     This is a demo application of a simple lambda function
*/

variable "app_version" {
}

resource "aws_lambda_function" "example" {
  function_name = "ServerlessExample"

  s3_bucket = "ja-lambda-function-upload"
  s3_key    = "example_v${var.app_version}.zip"

  handler = "main.handler"
  runtime = "nodejs10.x"

  role = "${aws_iam_role.lambda_exec.arn}"
}

# IAM role affects access to AWS services by the Lambda function
resource "aws_iam_role" "lambda_exec" {
  name = "serverless_example_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}