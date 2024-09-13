# Define the provider
provider "aws" {
  region = var.aws_region
}

# Create a key pair
resource "aws_key_pair" "web_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

# Create a security group for the web server
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"

  # Ingress rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidr_blocks
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.web_key.key_name

  security_groups = [aws_security_group.web_sg.name]

  # User data for provisioning the instance
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1.12 -y
              systemctl start nginx
              systemctl enable nginx
            EOF

  tags = {
    Name = "WebServer"
  }
}

# Output the public IP of the instance
output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}
