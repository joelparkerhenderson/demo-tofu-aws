##
# Tofu file with helpful annotations.
#
# This file has many annotations to explain how to use it.
# When you're creating you own systems, then you customize
# this file for your own purposes, with your own settings.
#
# We welcome questions and constructive feedback.
##

# The file starts with the `terraform` block configuration.
#
# Note: as a part of OpenTofu v1.x Compatibility Promises, the terraform block
# stays as-is. A tofu block may be introduced in the future, but it doesn't
# exist yet.
#
# If a configuration includes no backend block, OpenTofu defaults to using the
# local backend, which stores state as a plain file in the current working
# directory.
#
terraform {

  # The required_providers block describes Provider Requirements i.e. tells Tofu
  # which providers each individual module depends on, and also tells Tofu that
  # elsewhere in this module you can use the shorthand name to refer to it.
  #
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }

  # To save state to your local system, use this section.
  #
  # The default file name is terraform.tfstate.
  # We prefer the file name tofu.tfstate.
  #
  # backend "local" {
  #   path = "demo_tofu_aws.tfstate"
  # }

  # To save the state file in an S3 bucket, you need to configure the backend:
  #
  # https://opentofu.org/docs/language/settings/backends/s3/
  #
  # To enable bucket versioning, you need to configure the backend:
  #
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/manage-versioning-examples.html
  #
  # In practice, we manually create our S3 bucket:
  #
  #   * For a demo project, we prefer to keep the demo project state in its own
  #     S3 bucket, separate from any other demo S3 buckets and/or S3 usage.
  #
  #   * Therefore we use the bucket name "demo-tofu-aws-tfstate" to make it
  #     clear what the state bucket is intended to do, and that it's separate.
  #
  #   * We also append a random hex string to the bucket name to make it unique.
  #     You must change this because bucket names must be unique in a region.
  #
  #   * We prefer Access Control Lists (ACLs) to be disabled.
  #
  #   * We prefer to block all public access.
  #
  #   * We enable bucket versioning because we want to be able to revert to a
  #     previous state, such as when we make a mistake.
  #
  #   * We prefer to use the same name for the S3 bucket and the DynamoDB table
  #     because we like it to be easy to relate S3 items to DynamoDB items.
  #
  #
  backend "s3" {
    encrypt        = true
    bucket         = "demo-tofu-aws-tfstate-82ad5310410f344d222c12b070a04f63"
    key            = "demo_tofu_aws.tfstate"
    region         = "us-east-1"

    # dynamodb_table - (Optional) Name of DynamoDB Table to use for state
    # locking and consistency. The table must have a partition key named LockID
    # with type of String. If not configured, state locking will be disabled.
    dynamodb_table = "demo-tofu-aws-tfstate-82ad5310410f344d222c12b070a04f63"

  }
}
