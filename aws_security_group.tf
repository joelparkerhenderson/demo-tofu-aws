##
# aws_security_group
##

# Create a demo_tofu_aws security group, suitable for typical demo traffic, such
# as SSH for connecting to an EC2 instance, RDS PostgreSQL, and HTTPS web traffic.
# You will probably want to customize this for your own needs.
resource "aws_security_group" "demo_tofu_aws" {
  name        = "demo_tofu_aws"
  description = "Demo traffic such as SSH, HTTP, HTTPS, PostgreSQL"
  vpc_id      = aws_vpc.demo_tofu_aws.id

  tags = {
    Name = "demo_tofu_aws"
  }

  # If destroying a security group takes a long time, it may be because
  # Terraform cannot distinguish between a dependent object (e.g., a security
  # group rule or EC2 instance) that is in the process of being deleted and one
  # that is not. In other words, it may be waiting for a train that isn't
  # scheduled to arrive. To fail faster, shorten the delete timeout from the
  # default timeout.
  timeouts {
    delete = "2m"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.demo_tofu_aws.id
  cidr_ipv4         = aws_vpc.demo_tofu_aws.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv6" {
#   security_group_id = aws_security_group.demo_tofu_aws.id
#   cidr_ipv6         = aws_vpc.demo_tofu_aws.ipv6_cidr_block
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.demo_tofu_aws.id
  cidr_ipv4         = aws_vpc.demo_tofu_aws.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv6" {
#   security_group_id = aws_security_group.demo_tofu_aws.id
#   cidr_ipv6         = aws_vpc.demo_tofu_aws.ipv6_cidr_block
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.demo_tofu_aws.id
  cidr_ipv4         = aws_vpc.demo_tofu_aws.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv6" {
#   security_group_id = aws_security_group.demo_tofu_aws.id
#   cidr_ipv6         = aws_vpc.demo_tofu_aws.ipv6_cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }

resource "aws_vpc_security_group_ingress_rule" "allow_postgresql_ipv4" {
  security_group_id = aws_security_group.demo_tofu_aws.id
  cidr_ipv4         = aws_vpc.demo_tofu_aws.cidr_block
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}

# resource "aws_vpc_security_group_ingress_rule" "allow_postgresql_ipv6" {
#   security_group_id = aws_security_group.demo_tofu_aws.id
#   cidr_ipv6         = aws_vpc.demo_tofu_aws.ipv6_cidr_block
#   from_port         = 5432
#   ip_protocol       = "tcp"
#   to_port           = 5432
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.demo_tofu_aws.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" 
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
#   security_group_id = aws_security_group.demo_tofu_aws.id
#   cidr_ipv6         = "::/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }
