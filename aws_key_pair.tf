##
# AWS Key Pair
#
# Provides an EC2 key pair resource. A key pair is used to control login access
# to EC2 instances. This demo requires an existing user-supplied key pair. This
# key pair's public key will be registered with AWS to allow logging-in to EC2
# instances.
##

resource "aws_key_pair" "demo_tofu_aws" {
  key_name   = "demo_tofu_aws"
  public_key = file("demo_tofu_aws_key_pair.pub")
}
