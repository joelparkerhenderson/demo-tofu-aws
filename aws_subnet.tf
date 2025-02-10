##
# AWS subnet
#
# To improve security, you can use subnets to create network segments within a
# virtual e cloud (VPC). For example, in you can create a public subnet
# and a e subnet, then you can configure communication between them.
#
# To ensure High Availability (HA), you need to specify subnets in two different
# Availability Zones (AZs).
#
# Each AZ operates in a different data center. If an AZ fails, the Amazon RDS
# service will automatically launch a replacement database in a different AZ.
# Therefore, HA requires a minimum of two different AZs to be specified.
##

resource "aws_subnet" "demo_tofu_aws_az_0_subnet_0" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 0)
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "demo_tofu_aws_az_0_subnet_0"
  }
}

resource "aws_subnet" "demo_tofu_aws_az_0_subnet_1" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 1)
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "demo_tofu_aws_az_0_subnet_1"
  }
}

resource "aws_subnet" "demo_tofu_aws_az_1_subnet_0" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 2)
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "demo_tofu_aws_az_1_subnet_0"
  }
}

resource "aws_subnet" "demo_tofu_aws_az_1_subnet_1" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 3)
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "demo_tofu_aws_az_1_subnet_1"
  }
}
