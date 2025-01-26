##
# AWS subnet
##

resource "aws_subnet" "demo_tofu_aws" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 8, 1)
  map_public_ip_on_launch = true
}
