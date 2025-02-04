##
# AWS route table association
#
# Provides a resource to create an association between a route table and a
# subnet or a route table and an internet gateway or virtual private gateway.
##

resource "aws_route_table_association" "demo_tofu_aws" {
  gateway_id     = aws_internet_gateway.demo_tofu_aws.id
  route_table_id = aws_route_table.demo_tofu_aws.id
}
