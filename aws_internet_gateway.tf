##
# AWS internet gateway
#
# Provides a resource to create a virtual private cloud internet gateway.
#
# An internet gateway is a horizontally scaled, redundant, and highly available
# VPC component that allows communication between your VPC and the internet. It
# supports IPv4 and IPv6 traffic. It does not cause availability risks or
# bandwidth constraints on your network traffic.
#
# An internet gateway enables resources in your public subnets (such as EC2
# instances) to connect to the internet if the resource has a public IPv4
# address or an IPv6 address. Similarly, resources on the internet can initiate
# a connection to resources in your subnet using the public IPv4 address or IPv6
# address. For example, an internet gateway enables you to connect to an EC2
# instance in AWS using your local computer.
#
# An internet gateway provides a target in your VPC route tables for
# internet-routable traffic. For communication using IPv4, the internet gateway
# also performs network address translation (NAT). For more information, see IP
# addresses and NAT.
##

resource "aws_internet_gateway" "demo_tofu_aws" {
  vpc_id = aws_vpc.demo_tofu_aws.id

  tags = {
    Name = "demo_tofu_aws"
  }
}
