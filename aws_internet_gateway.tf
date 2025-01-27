##
# AWS internet gateway
#
# Provides a resource to create a virtual private cloud internet Gateway.
##

resource "aws_internet_gateway" "demo_tofu_aws" {
  vpc_id = aws_vpc.demo_tofu_aws.id

  tags = {
    Name = "demo_tofu_aws"
  }
}
