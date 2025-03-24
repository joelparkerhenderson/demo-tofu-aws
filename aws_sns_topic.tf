##
# AWS SNS Topic
#
# Provides an SNS topic resource
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
##

resource "aws_sns_topic" "demo_tofu_aws" {
  name = "demo_tofu_aws"
}
