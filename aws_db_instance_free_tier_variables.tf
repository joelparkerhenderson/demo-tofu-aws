##
#
# AWS database instance free tier variables
#
##

variable "aws_db_instance__free_tier__instance_class" {
  description = <<-XXX
    AWS db instance -> free tier -> instance class.
    For this demo, we choose db.t4g.micro, which is free tier.
    The "4" means fourth-generation, more recent than the "3".
    The "g" means Graviton chip, which has better performance.
    XXX
  type = string
  default = "db.t4g.micro"
  validation {
    condition = length(var.aws_db_instance__free_tier__instance_class) > 0
    error_message = "Length must be > 0."
  }
}

variable "aws_db_instance__allocated_storage__free_tier" {
  description = <<-XXX
    AWS -> db instance -> allocated_storage -> free tier.
    For this demo, we choose the largest storage option.
    XXX
  type = string
  default = "20"
  validation {
    condition = length(var.aws_db_instance__allocated_storage__free_tier) > 0
    error_message = "Length must be > 0."
  }
}
