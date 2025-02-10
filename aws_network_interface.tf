##
# AWS network instance
##

# Uncomment this if you wish to create your own aws network interface.
# This demo doesn't need this because AWS automatically creates it for us.

resource "aws_network_interface" "demo_tofu_aws" {
  subnet_id       = aws_subnet.demo_tofu_aws_az_0_subnet_0.id
  private_ips     = ["10.0.0.50"]
  security_groups = [aws_security_group.demo_tofu_aws.id]

  attachment {
    instance = aws_instance.demo_tofu_aws.id
    device_index = 1
  }

  tags = {
    Name = "demo_tofu_aws"
  }

}
