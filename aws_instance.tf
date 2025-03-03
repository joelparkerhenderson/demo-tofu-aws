##
# AWS EC2 instance
#
# Provides an EC2 instance resource. This allows instances to be created,
# updated, and deleted. Instances also support provisioning.
##

# Create an EC2 instance, using our existing key pair from above.
resource "aws_instance" "demo_tofu_aws" {
  ami                         = var.aws_instance__free_tier__ami # data.aws_ami.ubuntu_with_current_version.id
  instance_type               = var.aws_instance__free_tier__instance_type
  associate_public_ip_address = true
  key_name                    = "demo_tofu_aws"
  subnet_id                   = aws_subnet.demo_tofu_aws_az_0_subnet_0.id
  vpc_security_group_ids      = [aws_security_group.demo_tofu_aws.id]
  depends_on                  = [aws_internet_gateway.demo_tofu_aws]

  tags = {
    Name = "demo_tofu_aws"
  }

  root_block_device {
    volume_size = var.aws_instance__free_tier__root_block_device__volume_size
  }

  # Install some typical software, by using the typical package manager.
  # You will likely want to customize this section for your own purposes.
  # Install some typical software, by using the typical package manager.
  # You will likely want to customize this section for your own purposes.
  user_data = <<EOF
    #!/bin/sh

    # Update
    sudo apt-get -q -y update
    sudo apt-get -q -y upgrade

    # Infrastructure
    sudo apt-get install -q -y apt-transport-https
    sudo apt-get install -q -y build-essential
    sudo apt-get install -q -y ca-certificates
    sudo apt-get install -q -y curl
    sudo apt-get install -q -y gnupg-agent
    sudo apt-get install -q -y software-properties-common

    # Libraries
    sudo apt-get install -q -y libssl-dev
    sudo apt-get install -q -y libv8-dev

    # Typicals
    sudo apt-get install -q -y default-jdk
    sudo apt-get install -q -y emacs
    sudo apt-get install -q -y fd-find
    sudo apt-get install -q -y git
    sudo apt-get install -q -y git-core
    sudo apt-get install -q -y htop
    sudo apt-get install -q -y jq
    sudo apt-get install -q -y nginx
    sudo apt-get install -q -y openssl
    sudo apt-get install -q -y python
    sudo apt-get install -q -y ripgrep
    sudo apt-get install -q -y ruby
    sudo apt-get install -q -y tmux
    sudo apt-get install -q -y vim
    sudo apt-get install -q -y wget

    # Node-related
    sudo apt-get install -q -y nodejs
    sudo apt-get install -q -y npm
    sudo npm install -g express

    # Docker-related
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get -q -y update
    sudo apt-get install -q -y docker-ce
    sudo apt-get install -q -y docker-ce-cli
    sudo apt-get install -q -y containerd.io

    # Finish
    sudo apt-get -q -y autoclean
    sudo apt-get -q -y --purge autoremove

  EOF

}
