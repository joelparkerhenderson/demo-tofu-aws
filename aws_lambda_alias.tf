##
# AWS lambda alias
#
# Gives an external source (like an AWS EventBridge Rule, AWS SNS, or AWS S3)
# permission to access the Lambda function.
#
# Interconnections:
#
#   * aws_lambda_function
#   * aws_lambda_alias
#   * aws_lambda_permission
##

resource "aws_lambda_alias" "demo_tofu_aws" {
  name             = "demo_tofu_aws"
  description      = "Demo Tofu AWS + AWS lambda alias"
  function_name    = aws_lambda_function.demo_tofu_aws.function_name
  function_version = "$LATEST"
}
