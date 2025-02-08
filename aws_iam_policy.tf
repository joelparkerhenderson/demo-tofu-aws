##
# AWS IAM Policy
#
# This file is a quick example of what AWS IAM can do for policies.
# For a production application, you would definitely want to lock down
# the policies and permissions so the demo user can't corrupt anything.
#
# If you want to provide even more protection, AWS recommends using
# a separate account per purpose, such as a separate demo account.
# This ensures that even if something goes off the rails with a demo,
# then the only effects are in the demo account.
##

resource "aws_iam_policy" "demo_tofu_aws" {
  name        = "demo_tofu_aws"
  path        = "/"
  description = "Demo Tofu AWS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:ec2:*:*:key-pair/demo_tofu_aws",
          "arn:aws:ecs:*:*:cluster/*",
          "arn:aws:ecr:*:*:repository/demo_tofu_aws",
          "arn:aws:iam::*:user/demo_tofu_aws",
          "arn:aws:iam::*:policy/demo_tofu_aws",
          "arn:aws:iam::*:role/demo_tofu_aws",
          "arn:aws:iam::*:role/demo_tofu_aws_assume_role_lambda",
          "arn:aws:lambda:*:*:function:demo_tofu_aws_hello_world",
          "arn:aws:lambda:*:*:function:demo_tofu_aws_hello_world:*",
          "arn:aws:lambda:*:*:function:demo_tofu_aws_hello_world:demo_tofu_aws",
          "arn:aws:rds:*:*:subgrp:demo_tofu_aws",
          "arn:aws:s3:::demo-tofu-aws",
          "arn:aws:s3:::demo-tofu-aws/*",
          "arn:aws:sns:*:*:demo_tofu_aws"
        ]
      },
      {
        "Action": [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:dynamodb:*:*:table/tofu-*"
        ]
      },
      {
        Action : [
          "apigateway:GET",
          "apigateway:POST",
          "ec2:AssociateRouteTable",
          "ec2:AttachInternetGateway",
          "ec2:AttachNetworkInterface",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateInternetGateway",
          "ec2:CreateNetworkInterface",
          "ec2:CreateRoute",
          "ec2:CreateRouteTable",
          "ec2:CreateSecurityGroup",
          "ec2:CreateSubnet",
          "ec2:CreateTags",
          "ec2:CreateVpc",
          "ec2:DeleteKeyPair",
          "ec2:DeleteTags",
          "ec2:Describe*",
          "ec2:DeleteInternetGateway",
          "ec2:DeleteRoute",
          "ec2:DeleteRouteTable",
          "ec2:DeleteSubnet",
          "ec2:DeleteVpc",
          "ec2:DetachNetworkInterface",
          "ec2:DeleteNetworkInterface",
          "ec2:DeleteSecurityGroup",
          "ec2:ImportKeyPair",
          "ec2:ModifyInstanceAttribute",
          "ec2:ModifySubnetAttribute",
          "ec2:ModifyVpcAttribute",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RunInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "iam:CreatePolicy",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "rds:Describe*",
          "rds:CreateDBInstance",
          "route53:CreateHostedZone",
          "s3:GetObject"
        ],
        Effect : "Allow",
        Resource : "*"
      }
    ]
  })
}
