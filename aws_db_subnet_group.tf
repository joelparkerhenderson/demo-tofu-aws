##
# AWS database subnet group
#
# Provides an RDS DB subnet group resource.
##

resource "aws_db_subnet_group" "demo_tofu_aws" {
  name       = "demo_tofu_aws"
  subnet_ids = [aws_subnet.demo_tofu_aws.id]

  tags = {
    Name = "Demo Tofu AWS"
  }
}
