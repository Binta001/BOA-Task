# AWS Region
aws_region = "us-east-1"

# SSH Key Pair
key_name   = "web-server-key"
public_key = "ssh-rsa YOUR_PUBLIC_KEY"

# AMI ID
ami_id = "ami-0c55b159cbfafe1f0"  # Update to the desired AMI ID

# Instance Type
instance_type = "t2.micro"

# CIDR Blocks
ssh_cidr_blocks = ["0.0.0.0/0"]
http_cidr_blocks = ["0.0.0.0/0"]