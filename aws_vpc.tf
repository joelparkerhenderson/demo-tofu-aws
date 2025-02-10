##
# AWS Virtual Private Cloud (VPC)
#
# Amazon Virtual Private Cloud (VPC) is a virtual network that allows users to
# launch Amazon Web Services (AWS) resources in a logically isolated section of
# the AWS cloud. After you create a VPC, you can add subnets.
#
# https://spacelift.io/blog/terraform-aws-vpc
#
# A VPC spans all the Availability Zones (AZ) in a region. It is always
# associated with a CIDR range (both IPv4 and IPv6) which defines the number of
# internal network addresses that may be used internally.
#
# Within the VPC, we create subnets that are specific to AZs. It is possible to
# have multiple subnets in the same AZ. The purpose of subnets is to internally
# segregate resources contained in the VPC in every AZ. AWS Regions consist of
# multiple Availability Zones for DR purposes.
#
# When a VPC is created, a corresponding Route Table is also created, which
# defines a default route that lets the components in the VPC communicate with
# each other internally. The route table thus created is called the main route
# table.
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
