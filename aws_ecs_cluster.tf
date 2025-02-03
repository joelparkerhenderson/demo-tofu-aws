##
# AWS Elastic Container Service (ECS) cluster.
#
# Provide an ECS cluster.
##

resource "aws_ecs_cluster" "demo_tofu_aws" {

  # name - (Required) Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)
  name = "demo_tofu_aws"

  # setting - (Optional) Configuration block(s) with cluster settings.
  # For example, this can be used to enable CloudWatch Container Insights.
  setting {

    # name - (Required) Name of the setting to manage. Valid values: containerInsights.
    name  = "containerInsights"

    # value - (Required) Value to assign to the setting. Valid values: enhanced, enabled, disabled.
    value = "enabled"

  }
}
