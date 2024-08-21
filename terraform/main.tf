# Terraform configuration file for AWS setup
# In terraform/main.tf

provider "aws" {
  region = var.aws_region
}

# Security group for all instances
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# Controller server
resource "aws_instance" "controller_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "controller-server"
  }
}

# Agent servers
resource "aws_instance" "agent_servers" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "agent-server-${count.index + 1}"
  }
}

# Outputs
output "controller_public_ip" {
  value = aws_instance.controller_server.public_ip
}

output "agent_public_ips" {
  value = aws_instance.agent_servers[*].public_ip
}
