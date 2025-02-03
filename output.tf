##
# output
#
# Output values make information about your infrastructure available on the
# command line, and can expose information for other Tofu configurations to use. 
# Output values are similar to return values in programming languages.
##

output "instance_id" {
  description = "AWS EC2 instance ID"
  value       = aws_instance.demo_tofu_aws.id
}

output "instance_public_ip" {
  description = "AWS EC2 instance public IP"
  value       = aws_instance.demo_tofu_aws.public_ip
}
