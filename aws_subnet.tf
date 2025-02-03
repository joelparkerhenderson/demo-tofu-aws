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

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

resource "aws_subnet" "demo_tofu_aws_0" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnets(aws_vpc.demo_tofu_aws.cidr_block, 2, 2)[0]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[0]
  tags = {
    Name = "demo_tofu_aws_0"
  }
}

resource "aws_subnet" "demo_tofu_aws_1" {
  vpc_id                  = aws_vpc.demo_tofu_aws.id
  cidr_block              = cidrsubnets(aws_vpc.demo_tofu_aws.cidr_block, 2, 2)[1]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.demo_tofu_aws.names[1]
  tags = {
    Name = "demo_tofu_aws_1"
  }
}
