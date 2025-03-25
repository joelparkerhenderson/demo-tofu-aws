##
# AWS lambda permission
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

resource "aws_lambda_permission" "demo_tofu_aws_allow_api_gateway_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.demo_tofu_aws.function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method, and resource path
  # within the AWS API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.demo_tofu_aws.execution_arn}/*"
}

# resource "aws_lambda_permission" "demo_tofu_aws_allow_execution_from_cloudwatch" {
#   statement_id  = "AllowExecutionFromCloudWatch"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.demo_tofu_aws.function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_sns_topic.demo_tofu_aws.arn
#   qualifier     = aws_lambda_alias.demo_tofu_aws.name
# }

resource "aws_lambda_permission" "demo_tofu_aws_allow_execution_from_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.demo_tofu_aws.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.demo_tofu_aws.arn
}
