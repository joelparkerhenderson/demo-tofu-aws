##
# AWS route table
#
# Provides a resource to create a VPC routing table.
#
# A route table contains a set of rules, called routes, that determine where
# network traffic from your subnet or gateway is directed.
#
# You can make a subnet a public subnet by adding a route in your subnet route
# table to an internet gateway. To do this, create and attach an internet
# gateway to your VPC, and then add a route with a destination of 0.0.0.0/0 for
# IPv4 traffic or ::/0 for IPv6 traffic, and a target of the internet gateway ID
# (igw-xxxxxxxxxxxxxxxxx).
##

resource "aws_route_table" "demo_tofu_aws" {
  vpc_id = aws_vpc.demo_tofu_aws.id

  route {
    # cidr_block = "0.0.0.0/0"
    cidr_block = aws_subnet.demo_tofu_aws_0.cidr_block
    gateway_id = aws_internet_gateway.demo_tofu_aws.id
  }

  # route {
  #   ipv6_cidr_block = "::/0"
  #   gateway_id      = aws_internet_gateway.demo_tofu_aws.id
  # }

  tags = {
    Name = "demo_tofu_aws"
  }
}
