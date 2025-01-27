##
# AWS database subnet group
#
# Provides an RDS DB subnet group resource.
#
# To ensure High Availability, you need to specify subnets in two different
# Availability Zones (AZs).
#
# Each AZ operates in a different data center. If an AZ fails, the Amazon RDS
# service will automatically launch a replacement database in a different AZ.
# Therefore, it requires a minimum of two different AZs to be specified.
##

resource "aws_db_subnet_group" "demo_tofu_aws" {
  name       = "demo_tofu_aws"
  subnet_ids = [
    aws_subnet.demo_tofu_aws_availability_zone_0.id,
    aws_subnet.demo_tofu_aws_availability_zone_1.id,
  ]

  tags = {
    Name = "Demo Tofu AWS"
  }
}
