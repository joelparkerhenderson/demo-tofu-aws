##
# AWS API Gateway REST API
#
# Manages an API Gateway REST API. The REST API can be configured via importing
# an OpenAPI specification in the body argument (with other arguments serving as
# overrides) or via other Terraform resources to manage the resources
# (aws_api_gateway_resource resource), methods (aws_api_gateway_method
# resource), integrations (aws_api_gateway_integration resource), etc. of the
# REST API. Once the REST API is configured, the aws_api_gateway_deployment
# resource can be used along with the aws_api_gateway_stage resource to publish
# the REST API.
##

resource "aws_api_gateway_rest_api" "demo_tofu_aws" {
  name        = "Demo Tofu AWS"
  description = "Demo Tofu AWS + AWS API Gateway REST API"
}
