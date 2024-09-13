# Terraform Web Server Deployment

This repository contains a Terraform configuration to automate the deployment of an Nginx web server on an AWS EC2 instance. The configuration uses variables to avoid hardcoding values and follows best practices for flexibility and maintainability.

## Features

- Automates the provisioning of an EC2 instance on AWS.
- Configures a security group to allow SSH and HTTP access.
- Installs and configures Nginx as the web server.
- Outputs the public IP address of the instance.

## Requirements

- **Terraform** (>= 1.0.0)
- **AWS Account** with configured credentials
- **SSH Key** for accessing the EC2 instance

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/terraform-web-server.git
cd terraform-web-server
```

### 2. Configure AWS Credentials

Ensure your AWS credentials are properly configured. You can set them up using the AWS CLI:

```bash
aws configure
```

Alternatively, export them as environment variables:

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
```

### 3. Modify Variable Values

Edit the `terraform.tfvars` file to specify the actual values for your deployment.

**Example `terraform.tfvars` file:**

```hcl
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
```

### 4. Initialize Terraform

Initialize the Terraform working directory to install the required providers:

```bash
terraform init
```

### 5. Deploy the Infrastructure

Run the following command to deploy the web server:

```bash
terraform apply
```

Review the changes and confirm with `yes` to apply them.

### 6. Access the Web Server

After deployment, Terraform will output the public IP address of the EC2 instance. Use this IP to access the Nginx web server in your browser:

```bash
http://<public-ip>
```

### 7. Destroy the Infrastructure

To tear down the infrastructure and remove all resources, run:

```bash
terraform destroy
```

Confirm with `yes` to proceed.

## File Structure

```plaintext
terraform-web-server/
│
├── main.tf                # The main Terraform configuration file
├── variables.tf            # Definitions of variables
├── terraform.tfvars        # Variable values (not included in version control)
└── README.md               # Documentation for the project
```

## Resources Created

- **EC2 Instance**: Virtual machine running Nginx.
- **Security Group**: Allows SSH (port 22) and HTTP (port 80) access.
- **Key Pair**: SSH key for accessing the EC2 instance.

## Security Considerations

- **SSH Access**: The SSH access is open to the public (`0.0.0.0/0`) for demonstration purposes. In production, restrict SSH access to known IP addresses.
- **Monitoring and Updates**: Regularly monitor and update the EC2 instance to address vulnerabilities.
- **Credentials**: Ensure that sensitive data (e.g., public keys) is handled securely.
