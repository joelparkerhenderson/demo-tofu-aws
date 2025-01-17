##
# AWS default VPC
#
# Provides a resource to manage the default AWS VPC in the current AWS Region.
#
# Connect to our existing AWS default virtual public cloud (VPC). If your AWS
# doesn't have a default VPC, then you can either omit this block, or use the
# AWS console (or API) to create a default VPC.
#
# Import a default VPC such as:
#
#     tofu import aws_default_vpc.default vpc-9d069e6135c7e813dbc61872f38dc632
#
# The aws_default_vpc resource behaves differently from normal resources in that
# if a default VPC exists, Tofu does not create this resource, but instead
# "adopts" it into management. If no default VPC exists, Tofu creates a new
# default VPC, which leads to the implicit creation of other resources. By
# default, terraform destroy does not delete the default VPC but does remove the
# resource from Tofu state. 
##

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"
  }
}
