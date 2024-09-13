# AWS region
variable "aws_region" {
  description = "The AWS region to deploy to."
  default     = "us-east-1"
}

# SSH key pair name
variable "key_name" {
  description = "The name of the SSH key pair."
  type        = string
}

# SSH public key
variable "public_key" {
  description = "The public key for the SSH key pair."
  type        = string
}

# AMI ID
variable "ami_id" {
  description = "The AMI ID for the instance."
  type        = string
}

# Instance type
variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

# CIDR blocks for SSH access
variable "ssh_cidr_blocks" {
  description = "The CIDR blocks allowed to access the instance via SSH."
  default     = ["0.0.0.0/0"]
}

# CIDR blocks for HTTP access
variable "http_cidr_blocks" {
  description = "The CIDR blocks allowed to access the instance via HTTP."
  default     = ["0.0.0.0/0"]
}