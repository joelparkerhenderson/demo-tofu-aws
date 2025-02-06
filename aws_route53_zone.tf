##
# aws_route53_zone
#
# Manages a Route53 Hosted Zone. For managing Domain Name System Security
# Extensions (DNSSEC), see the aws_route53_key_signing_key and
# aws_route53_hosted_zone_dnssec resources.
#
# For use in subdomains, note that you need to create a aws_route53_record of
# type NS as well as the subdomain zone; see file aws_route53_record.tf.
##

resource "aws_route53_zone" "demo_tofu_aws" {
  name = "demo_tofu_aws.example.com"

  tags = {
    Environment = "demo_tofu_aws"
  }
}
