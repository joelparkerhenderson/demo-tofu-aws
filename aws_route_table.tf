##
# AWS route table
#
# Provides a resource to create a VPC routing table.
##

resource "aws_route_table" "demo_tofu_aws" {
  vpc_id = aws_vpc.demo_tofu_aws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_tofu_aws.id
  }

  tags = {
    Name = "Demo Tofu AWS"
  }
}
