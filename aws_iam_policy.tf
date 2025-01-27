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
        Action : [
          "apigateway:GET",
          "apigateway:POST",
          "ec2:AttachNetworkInterface",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateNetworkInterface",
          "ec2:CreateSecurityGroup",
          "ec2:CreateSubnet",
          "ec2:CreateTags",
          "ec2:CreateVpc",
          "ec2:DeleteKeyPair",
          "ec2:DeleteTags",
          "ec2:Describe*",
          "ec2:DeleteSubnet",
          "ec2:DeleteVpc",
          "ec2:DetachNetworkInterface",
          "ec2:DeleteNetworkInterface",
          "ec2:DeleteSecurityGroup",
          "ec2:ImportKeyPair",
          "ec2:ModifyInstanceAttribute",
          "ec2:ModifySubnetAttribute",
          "ec2:ModifyVpcAttribute",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RunInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "iam:CreatePolicy",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "rds:Describe*",
          "rds:CreateDBInstance"
        ],
        Effect : "Allow",
        Resource : "*"
      }
    ]
  })
}
