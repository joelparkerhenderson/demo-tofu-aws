##
# AWS Virtual Private Cloud (VPC)
#
# Amazon Virtual Private Cloud (VPC) is a virtual network that allows users to
# launch Amazon Web Services (AWS) resources in a logically isolated section of
# the AWS cloud. After you create a VPC, you can add subnets.
##

resource "aws_vpc" "demo_tofu_aws" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    name = "demo_tofu_aws"
  }
}
