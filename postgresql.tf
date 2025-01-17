##
# Database instance a.k.a. database object
##

# Uncomment these if you wish to create your own database.
# This demo doesn't need these because the database is automatically
# created during the setup in the file aws_db_instance.tf.
  
# provider "postgresql" {
#   host = aws_db_instance.demo_tofu_aws.address
#   port = aws_db_instance.demo_tofu_aws.port
#   database = aws_db_instance.demo_tofu_aws.db_name
#   username = aws_db_instance.demo_tofu_aws.username
#   password = aws_db_instance.demo_tofu_aws.password
#   superuser = false
#   sslmode = "require"
#   connect_timeout = 15
#   expected_version = aws_db_instance.demo_tofu_aws.engine_version
# }

# Equivalent SQL:
#
#     CREATE DATABASE demo;
#
# resource "postgresql_database" "demo_tofu_aws" {
#   name = aws_db_instance.demo_tofu_aws.db_name
#   owner = aws_db_instance.demo_tofu_aws.username
#   template = "template0"
#   encoding = "UTF8"
#   lc_collate = "C"
#   lc_ctype = "C"
#   connection_limit = 1
#   allow_connections = true
# }
