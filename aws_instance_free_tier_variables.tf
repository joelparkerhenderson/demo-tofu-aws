##
#
# AWS instance free tier variables
#
##

variable "aws_instance__free_tier__ami" {
  description = <<-XXX
    AWS instance -> free tier -> Amazon Machine Image.
    For this demo, we choose a recent Ubuntu free option.
    XXX
  type = string
  default = "ami-0e2c8caa4b6378d8c"
  validation {
    condition = can(regex("^ami-", var.aws_instance__free_tier__ami))
    error_message = "Length must be > 0."
  }
}

variable "aws_instance__free_tier__ami__username" {
  description = <<-XXX
    AWS instance -> free tier -> Amazon Machine Image -> username.
    For this demo, we choose Ubuntu, which automatically
    makes the initial instance sign in username \"ubuntu\".
    XXX
  type = string
  default = "ubuntu"
  validation {
    condition = contains(["ec2-user", "ubuntu"], var.aws_instance__free_tier__ami__username)
    error_message = "Length must be > 0."
  }
}

variable "aws_instance__free_tier__instance_type" {
  description = <<-XXX
    AWS instance -> free tier -> instance type.
    For this demo, we choose the highest-power free option.
    XXX
  type = string
  default = "t2.micro"
  validation {
    condition = can(regex("^[[:alnum:]]+\\.[[:alnum:]]+$", var.aws_instance__free_tier__instance_type))
    error_message = "Length must be > 0."
  }
}

variable "aws_instance__free_tier__root_block_device__volume_size" {
  description = <<-XXX
    AWS instance -> free tier -> root block device -> volume_size
    For this demo, we choose the most common free option.
    XXX
  type = number
  default = 30
  validation {
    condition = var.aws_instance__free_tier__root_block_device__volume_size > 0
    error_message = "Number must be > 0."
  }
}
