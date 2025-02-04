##
# AWS Elastic Container Registry (ERC) Repository 
#
# Provides an Elastic Container Registry Repository.
##

resource "aws_ecr_repository" "demo_tofu_aws" {
  name = "demo_tofu_aws"
}
