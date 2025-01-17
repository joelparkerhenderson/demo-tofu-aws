##
#
# AWS S3 bucket ownership controls
#
##

resource "aws_s3_bucket_ownership_controls" "demo_tofu_aws" {
  bucket = aws_s3_bucket.demo_tofu_aws.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
