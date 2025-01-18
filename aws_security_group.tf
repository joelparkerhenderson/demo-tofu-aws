##
# aws_security_group
##

# Create a demo_tofu_aws security group, suitable for typical demo traffic, such
# as SSH for connecting to an EC2 instance, RDS PostgreSQL, and HTTPS web traffic. 
# You will probably want to customize this for your own needs.
resource "aws_security_group" "demo_tofu_aws_security_group" {
  name        = "demo_tofu_aws_security_group"
  description = "Demo traffic such as SSH, HTTP, HTTPS, PostgreSQL"
  vpc_id      = aws_default_vpc.default.id

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow PostgreSQL
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
