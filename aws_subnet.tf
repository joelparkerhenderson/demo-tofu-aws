##
# AWS subnet
#
# To improve security, you can use subnets to create network segments within a
# virtual e cloud (VPC). For example, in you can create a public subnet and a e
# subnet, then you can configure communication between them.
#
# To ensure High Availability (HA), you need to specify subnets in two different
# Availability Zones (AZs).
#
# Each AZ operates in a different data center. If an AZ fails, the Amazon RDS
# service will automatically launch a replacement database in a different AZ.
# Therefore, HA requires a minimum of two different AZs to be specified.
#
# Classes:
#
# * Class A networks use a default subnet mask of 255.0.0.0 and have 0-127 as
#   their first octet. The address 10.52.36.11 is a class A address. Its first
#   octet is 10, which is between 0 and 127, inclusive.
#
# * Class B networks use a default subnet mask of 255.255.0.0 and have 128-191
#   as their first octet. The address 172.16.52.63 is a class B address. Its
#   first octet is 172, which is between 128 and 191, inclusive.
#
# * Class C networks use a default subnet mask of 255.255.255.0 and have 192-223
#   as their first octet. The address 192.168.123.132 is a class C address. Its
#   first octet is 192, which is between 192 and 223, inclusive.
#
# ## Subnetting
#
# A reasonable default would be to allocate a /24 per VPC which gives you
# 256 addresses. You can then subnet this into smaller blocks as needed. 
#
# For example one of these options:
#
# * 2 /25 subnets (x.x.x.0 - x.x.x.127 and x.x.x.128 - x.x.x.255)
#
# * 4 /26 subnets (0-63, 64-127, 128-191, 192-255)
#
# * 8 /27 subnets (0-31, 32-63, 64-95, 96-127, 128-159, 160-191, 192-223, 224-255)
#
# ## Example of four subnets
#
# You can divide your network into four subnets by using a subnet mask that
# makes the network address larger and the possible range of host addresses
# smaller. In other words, you are 'borrowing' some of the bits used for the
# host address, and using them for the network portion of the address. The
# subnet mask 255.255.255.192 gives you four networks of 62 hosts each. It works
# because in binary notation, 255.255.255.192 is the same as
# 1111111.11111111.1111111.11000000. The first two digits of the last octet
# become network addresses, so you get the additional networks 00000000 (0),
# 01000000 (64), 10000000 (128) and 11000000 (192). (Some administrators will
# only use two of the subnetworks using 255.255.255.192 as a subnet mask. For
# more information on this topic, see RFC 1878.) In these four networks, the
# last six binary digits can be used for host addresses.
#
# Using a subnet mask of 255.255.255.192, your 192.168.123.0 network then
# becomes the four networks 192.168.123.0, 192.168.123.64, 192.168.123.128 and
# 192.168.123.192. These four networks would have as valid host addresses:
#
# * 192.168.123.1-62 
# * 192.168.123.65-126 
# * 192.168.123.129-190 
# * 192.168.123.193-254
#
# Remember, again, that binary host addresses with all ones or all zeros are
# invalid, so you can't use addresses with the last octet of 0, 63, 64, 127,
# 128, 191, 192, or 255.
#
# You can see how it works by looking at two host addresses, 192.168.123.71 and
# 192.168.123.133. If you used the default Class C subnet mask of 255.255.255.0,
# both addresses are on the 192.168.123.0 network. However, if you use the
# subnet mask of 255.255.255.192, they are on different networks; 192.168.123.71
# is on the 192.168.123.64 network, 192.168.123.133 is on the 192.168.123.128
# network.
#
# ## Recommendation for production workloads
#
# https://www.reddit.com/user/Otroletravaladna/
#
# I choose a /16 CIDR block, and subdivide it in 4 /18 blocks. Each /18 block is
# a VPC: One for common services , one for live, one for stage, one for
# test/dev. Then I create VPC peering links to/from common-services to each of
# the environments. This way I can have all 3 environments (live, stage,
# testdev) connect to common services, and also I can reach all 3 environments
# from common services -while the environments can't see/reach each other).
#
# I then split each /18 block in 2 /19 blocks, I reserved the high /19 block,
# and split the low /19 in 32 /24 blocks, each belonging to an application.
#
# Then that /24 block can be subdivided in as many sub blocks as layers your app
# has (for instance, you can subdivide a /24 block in 8 /27 blocks, each
# belonging to a layer in your app). For public-facing applications I assign one
# of the app layers as a Public/frontend subnet, with the route table bound to
# an IGW, and the private layers use a route table with a NAT gateway. This way
# I can have the frontend servers in a public IP and the rest of the systems in
# private subnets.
#
# Then each /27 block can be divided in either 2 /28 sub blocks or 4 /29 sub
# blocks, depending on how many AZs you want to put each layer on.
#
# This way I can have well-structured, well-isolated CIDR blocks:
#
# * per environment (/18)
#
# * per application (/24)
#
# * per layer (/27 for an 8-layer app)
#
# * per-AZ-in-layer (/28 or /29)
#
# which I can use for very fine grained Security Groups to restrict/allow
# connectivity between layers of your app. The sizes and subdivisions of each
# CIDR block can (and should!) be tuned depending on the requirements, but the
# subdivision order (Environment => Application => Layer => AZ) should be kept. 
#
# ## cidrsubnet examples
#
# cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 0) = "10.0.0.0/28" 
# cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 1) = "10.0.0.16/28" 
# cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 2) = "10.0.0.32/28"
# cidrsubnet(aws_vpc.demo_tofu_aws.cidr_block, 4, 3) = "10.0.0.48/28"
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
