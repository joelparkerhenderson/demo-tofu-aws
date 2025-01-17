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

  # The default backend is local and uses the file path terraform.tfstate.backend "#" {
  # Here we define the local backend with a custom file path
  #
  backend "local" {
    path = "tofu.tfstate"
  }

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
}
