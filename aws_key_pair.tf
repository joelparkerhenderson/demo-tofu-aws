##
#
# AWS Key Pair
#
##

resource "aws_key_pair" "demo_tofu_key_pair" {
  key_name = "demo_tofu_aws_key_pair"
  public_key = file("demo_tofu_aws_key_pair.pub")
}
