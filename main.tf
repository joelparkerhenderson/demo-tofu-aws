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
  #   path = "tofu.tfstate"
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
  #   * We prefer the bucket name "tofu" because it's simple. You may freely
  #     change this as you wish.
  #
  #   * We append a random string to the bucket name to make it unique. You must
  #     change this because your bucket name must be globally unique in the
  #     region.
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
    bucket         = "tofu-cec9c231e605b826c29dfaffde284a99"
    key            = "demo-tofu-aws.tfstate"
    region         = "us-east-1"

    # dynamodb_table - (Optional) Name of DynamoDB Table to use for state
    # locking and consistency. The table must have a partition key named LockID
    # with type of String. If not configured, state locking will be disabled.
    dynamodb_table = "tofu-cec9c231e605b826c29dfaffde284a99"

  }
}
