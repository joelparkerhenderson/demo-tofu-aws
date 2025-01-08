provider "aws" {
  # Tofu needs to know the AWS settings:
  #
  #   * AWS access key
  #   * AWS secret_key
  #   * AWS region (optional)
  #   * AWS default region (optional)
  #   * AWS session token (optional)
  #
  # Tofu will automatically search for AWS settings such as via:
  #
  #   * ~/.aws/credentials
  #   * IAM instance profile credentials
  #   * environment variables
  #
  # Example of environment variables:
  #
  # ```sh
  # export AWS_ACCESS_KEY_ID="6IAIN7RHCYWDYJAHV8LS"
  # export AWS_SECRET_ACCESS_KEY="OJif8/L9UgHqfJzkO3RDqEcypvWkilfkfe8N5YOO"
  # export AWS_REGION="us-east-1"
  # export AWS_DEFAULT_REGION="us-east-1"
  # export AWS_SESSION_TOKEN=""
  #
}
