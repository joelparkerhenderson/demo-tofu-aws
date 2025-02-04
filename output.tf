##
# output
#
# Output values make information about your infrastructure available on the
# command line, and can expose information for other Tofu configurations to use.
# Output values are similar to return values in programming languages.
##

output "aws_s3_bucket__demo_tofu_aws__arn" {
  description = "AWS S3 bucket -> demo_tofu_aws -> ARN"
  value       = aws_s3_bucket.demo_tofu_aws.arn
}

output "aws_s3_bucket__demo_tofu_aws__bucket" {
  description = "AWS S3 bucket -> demo_tofu_aws -> bucket"
  value       = aws_s3_bucket.demo_tofu_aws.bucket
}

output "aws_db_instance__demo_tofu_aws__address" {
  description = "AWS DB instance -> demo_tofu_aws -> address"
  value       = aws_db_instance.demo_tofu_aws.address
}

output "aws_db_instance__demo_tofu_aws__arn" {
  description = "AWS DB instance -> demo_tofu_aws -> ARN"
  value       = aws_db_instance.demo_tofu_aws.arn
}

output "aws_db_instance__demo_tofu_aws__port" {
  description = "AWS DB instance -> demo_tofu_aws -> port"
  value       = aws_db_instance.demo_tofu_aws.port
}

output "aws_instance__demo_tofu_aws__arn" {
  description = "AWS EC2 instance -> demo_tofu_aws -> ARN"
  value       = aws_instance.demo_tofu_aws.arn
}

output "aws_instance__demo_tofu_aws__id" {
  description = "AWS EC2 instance -> demo_tofu_aws -> id"
  value       = aws_instance.demo_tofu_aws.id
}

output "aws_instance__demo_tofu_aws__public_ip" {
  description = "AWS EC2 instance -> demo_tofu_aws -> public IP"
  value       = aws_instance.demo_tofu_aws.public_ip
}

output "aws_ecr_repository__demo_tofu_aws__arn" {
  description = "AWS ECR repository -> demo_tofu_aws -> ARN"
  value       = aws_ecr_repository.demo_tofu_aws.arn
}

output "aws_ecr_repository__demo_tofu_aws__url" {
  description = "AWS ECR repository -> demo_tofu_aws -> URL"
  value       = aws_ecr_repository.demo_tofu_aws.repository_url
}

output "aws_ecs_cluster__demo_tofu_aws__arn" {
  description = "AWS ECS cluster -> demo_tofu_aws -> ARN"
  value       = aws_ecs_cluster.demo_tofu_aws.arn
}

output "aws_ecs_cluster__demo_tofu_aws__name" {
  description = "AWS ECS cluster -> demo_tofu_aws -> name"
  value       = aws_ecs_cluster.demo_tofu_aws.name
}
