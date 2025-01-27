##
# AWS Virtual Private Cloud (VPC)
#
# Amazon Virtual Private Cloud (VPC) is a virtual network that allows users to
# launch Amazon Web Services (AWS) resources in a logically isolated section of
# the AWS cloud. After you create a VPC, you can add subnets.
#
# This is the platform on which we host the entire demo infrastructure. 
##

resource "aws_vpc" "demo_tofu_aws" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "demo_tofu_aws"
  }
}
