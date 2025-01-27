variable "aws_region" {
  description = <<-XXX
    AWS Region
    XXX
  type = string
  default = "us-east-1"
  validation {
    condition = can(regex("^[-a-z0-9]+$", var.aws_region))
    error_message = "Regex must match"
  }
}
