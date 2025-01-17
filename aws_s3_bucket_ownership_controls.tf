##
# AWS S3 bucket ownership controls
#
# Provides a resource to manage S3 Bucket Ownership Controls. 
#
# For more information, see the S3 Developer Guide.
#
# Interconnections:
#
#   * aws_s3_bucket
#   * aws_s3_bucket_acl
#   * aws_s3_bucket_ownership_controls
##

resource "aws_s3_bucket_ownership_controls" "demo_tofu_aws" {
  bucket = aws_s3_bucket.demo_tofu_aws.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
