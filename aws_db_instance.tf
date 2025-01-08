##
#
# AWS database instance
#
##

variable "aws_db_instance__demo_tofu_aws__username" {
  description = <<-XXX
    AWS db instance: demo_tofu_aws: username. 
    This is the username of the PostgreSQL role that will sign in. 
    This works with aws_db_instance__demo_tofu_aws__password. 
    This demo uses \"postgres\" because it's the default PostgreSQL database username.
    XXX
  type = string
  default = "postgres"
  validation {
    condition = length(var.aws_db_instance__demo_tofu_aws__username) > 0
    error_message = "Length must be > 0."
  }
}

variable "aws_db_instance__demo_tofu_aws__password" {
  description = <<-XXX
    AWS db instance: demo_tofu_aws: password. 
    This is the password of the PostgreSQL role that will sign in. 
    This works with aws_db_instance__demo_tofu_aws__username. 
    This demo uses our preference of a ZID, which is any secure random 32-character lowercase hexadecimal string.
    XXX
  type = string
  default = "e9d84ecb95c01e1b9db44cdb95045542"
  validation {
    condition = length(var.aws_db_instance__demo_tofu_aws__password) > 0
    error_message = "Length must be > 0."
  }
  sensitive = true
}

variable "aws_db_instance__demo_tofu_aws__db_name" {
  description = <<-XXX
    AWS db instance: demo_tofu_aws: db_name. 
    This is the PostgreSQL database name that will be created.
    This demo uses "demo_tofu_aws" because it makes it easy to see which database goes with this demo.
    XXX
  type = string
  default = "demo_tofu_aws"
  validation {
    condition = length(var.aws_db_instance__demo_tofu_aws__db_name) > 0
    error_message = "Length must be > 0."
  }
}

variable "aws_db_instance__demo_tofu_aws__identifier" {
  description = <<-XXX
    AWS db instance: demo_tofu_aws: password. 
    This is the AWS-specific identifier of the the PostgreSQL instance.
    This demo uses \"demo-tofu-aws\" because it makes it easy to see which database goes with this demo,
    and AWS syntax prohibits underscores, so we use hyphens instead.
    XXX
  type = string
  default = "demo-tofu-aws"
  validation {
    condition = can(regex("^[-[:alnum:]]+$", var.aws_db_instance__demo_tofu_aws__identifier))
    error_message = "Length must be > 0."
  }
}

resource "aws_db_instance" "demo_tofu_aws" {

  # Only lowercase alphanumeric characters and hyphens allowed in "identifier".
  # Terraform default is  a random, unique identifier.
  identifier = var.aws_db_instance__demo_tofu_aws__identifier

  # The RDS instance class.
  # https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html
  instance_class = var.aws_db_instance__free_tier__instance_class

  # The allocated storage in gibibytes.
  allocated_storage = var.aws_db_instance__allocated_storage__free_tier

  # The database engine name such as "postgres", "mysql", "aurora", etc.
  # https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html
  engine = "postgres"

  # The master account username and password.
  # Note that these settings may show up in logs,
  # and will be stored in the state file in raw text.
  #
  # We strongly recommend doing this differently if you
  # are building a production system or secure system.
  #
  # These variables are set in the file .env.auto.tfvars
  # and you can see the example file .env.example.auto.tfvars.
  username = var.aws_db_instance__demo_tofu_aws__username
  password = var.aws_db_instance__demo_tofu_aws__password

  # The name of the database to create when the DB instance is created. Optional.
  db_name = var.aws_db_instance__demo_tofu_aws__db_name

  # List of VPC security groups to associate. Optional. 
  vpc_security_group_ids = [aws_security_group.demo_tofu_aws_security_group.id]

  # We like to use the database with public tools such as DB admin apps.
  publicly_accessible = "true"

  # We like performance insights, which help us optimize the data use.
  performance_insights_enabled = "true"

  # We like to have the demo database update to the current version.
  allow_major_version_upgrade = "true"

  # We like backup retention for as long as possible.
  backup_retention_period = "35"

  # Backup window time in UTC is in the middle of the night in the United States.
  backup_window = "08:00-09:00"

  # We prefer to preserve the backups if the database is accidentally deleted.
  delete_automated_backups = "false"

  # Maintenance window is after backup window, and on Sunday, and in the middle of the night.
  maintenance_window = "sun:09:00-sun:10:00"

  # skip_final_snapshot - (Optional) Determines whether a final DB snapshot is
  # created before the DB instance is deleted. If true is specified, no
  # DBSnapshot is created. If false is specified, a DB snapshot is created
  # before the DB instance is deleted, using the value from
  # final_snapshot_identifier. Default is false.
  skip_final_snapshot = true

}
