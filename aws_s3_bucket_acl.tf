##
#
# AWS S3 bucket access control list (ACL)
#
##

resource "aws_s3_bucket_acl" "demo_tofu_aws" {
  depends_on = [aws_s3_bucket_ownership_controls.demo_tofu_aws]

  bucket = aws_s3_bucket.demo_tofu_aws.id
  acl = "private"
}
