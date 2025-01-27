##
# AWS subnet
#
# To ensure High Availability, you need to specify subnets in two different
# Availability Zones (AZs).
#
# Each AZ operates in a different data center. If an AZ fails, the Amazon RDS
# service will automatically launch a replacement database in a different AZ.
# Therefore, it requires a minimum of two different AZs to be specified.
##

resource "aws_subnet" "demo_tofu_aws_availability_zone_0" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnets(aws_vpc.demo_tofu_aws.cidr_block, 2, 2)[0]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[0]
  tags = {
    Name = "demo_tofu_aws_availability_zone_0"
  }
}

resource "aws_subnet" "demo_tofu_aws_availability_zone_1" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnets(aws_vpc.demo_tofu_aws.cidr_block, 2, 2)[1]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[1]
  tags = {
    Name = "demo_tofu_aws_availability_zone_1"
  }
}
