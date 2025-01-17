##
# AWS S3 bucket access control list (ACL)
#
# Provides an S3 bucket ACL resource.
#
# Interconnections:
#
#   * aws_s3_bucket
#   * aws_s3_bucket_acl
#   * aws_s3_bucket_ownership_controls
##

resource "aws_s3_bucket_acl" "demo_tofu_aws" {
  depends_on = [aws_s3_bucket_ownership_controls.demo_tofu_aws]

  bucket = aws_s3_bucket.demo_tofu_aws.id
  acl    = "private"
}
