##
#
# AWS network instance
#
##

# Uncomment this if you wish to create your own aws network interface.
# This demo doesn't need this because AWS automatically creates it for us.

# resource "aws_network_interface" "demo_tofu_aws_network_interface" {
#   subnet_id       = aws_subnet.public_a.id
#   private_ips     = ["10.0.0.50"]
#   security_groups = [aws_security_group.demo_tofu_aws_security_group.id]
#
#   attachment {
#     instance = aws_instance.test.id
#     device_index = 1
#   }
# }
