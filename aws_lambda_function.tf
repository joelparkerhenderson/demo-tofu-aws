##
# AWS lambda function
#
# Provides a Lambda Function resource. Lambda allows you to trigger execution of
# code in response to events in AWS, enabling serverless backend solutions. The
# Lambda Function itself includes source code and runtime configuration.
#
# Interconnections:
#
#   * aws_lambda_function
#   * aws_lambda_alias
#   * aws_lambda_permission
##

resource "aws_lambda_function" "demo_tofu_aws" {

  # filename - The function source code, bundled as a zip file.
  filename      = "hello_world.zip"
  function_name = "hello_world"
  role          = aws_iam_role.demo_tofu_aws_assume_role_lambda.arn
  handler       = "index.handler"

  # runtime - The programming language and version that the function needs.
  runtime = "python3.13"

  # source_code_hash - The hash of the source code zip file.
  source_code_hash = filebase64sha256("hello_world.zip")

}

resource "aws_iam_role" "demo_tofu_aws_assume_role_lambda" {
  name = "demo_tofu_aws"

  # Tofu's "jsonencode" function converts a
  # Tofu expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
