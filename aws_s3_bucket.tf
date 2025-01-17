##
# AWS S3 bucket
#
# Interconnections:
#
#   * aws_s3_bucket
#   * aws_s3_bucket_acl
#   * aws_s3_bucket_ownership_controls
##

resource "aws_s3_bucket" "demo_tofu_aws" {

  # bucket - (Optional, Forces new resource) Name of the bucket. If omitted,
  # Tofu will assign a random, unique name. Must be lowercase < 64 characters.
  bucket = "demo-tofu-aws"

  # tags - (Optional) Map of tags to assign to the bucket. If
  tags = {
    Name        = "Demo Tofu AWS"
    Environment = "Development"
  }

  # force_destroy - (Optional, Default:false) Boolean that indicates all objects
  # (including any locked objects) should be deleted from the bucket when the
  # bucket is destroyed so that the bucket can be destroyed without error. These
  # objects are not recoverable.
  force_destroy = true

}
