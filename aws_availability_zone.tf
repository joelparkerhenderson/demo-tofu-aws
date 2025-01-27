variable "aws_availability_zone" {
  description = <<-XXX
    AWS Availability Zone
    XXX
  type = string
  default = "us-east-1a"
  validation {
    condition = can(regex("^[-a-z0-9]+$", var.aws_availability_zone))
    error_message = "Regex must match"
  }
}
