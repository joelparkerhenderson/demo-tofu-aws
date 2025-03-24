##
# AWS SNS topic subscription
#
# Provides a resource for subscribing to SNS topics. Requires that an SNS topic
# exist for the subscription to attach to. This resource allows you to
# automatically place messages sent to SNS topics in SQS queues, send them as
# HTTP(S) POST requests to a given endpoint, send SMS messages, or notify
# devices / applications. The most likely use case for Terraform users will
# probably be SQS queues.
##

resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.demo_tofu_aws.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.demo_tofu_aws.arn
}
