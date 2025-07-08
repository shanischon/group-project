# ------------------------------------------------------------------
# │ File:    main.tf (Root)                                       │
# │ Author:  Member 5 (Composer)                                 │
# │ Branch:  feature/root-main                                   │
# │ Purpose: Assembles all infrastructure components together    │
# ------------------------------------------------------------------

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a key pair for SSH access
resource "aws_key_pair" "deployer" {
  key_name   = "${var.project_name}-deployer-key"
  # This is a placeholder - in a real environment, you would use your own public key
  # For the exercise, we're using a placeholder that won't actually work for SSH access
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxyz..." 
  
  tags = var.default_tags
}

# Create the security group using the security_group module
module "web_security" {
  source = "./modules/security_group"
  
  vpc_id    = "vpc-12345678" # Replace with your actual VPC ID or use a variable
  my_ip     = "${chomp(data.http.my_ip.response_body)}/32"
  open_ports = [22, 80, 443] # SSH, HTTP, HTTPS
}

# Get the current public IP for SSH access
data "http" "my_ip" {
  url = "https://api.ipify.org"
}

# Create the S3 bucket for backups using the s3_bucket module
module "backups" {
  source = "./modules/s3_bucket"
  
  bucket_prefix = var.project_name
}

# Create the EC2 instance and related resources using the ec2_service module
module "app_server" {
  source = "./modules/ec2_service"
  
  ami_id            = data.aws_ami.amazon_linux.id
  instance_type     = var.instance_type
  key_name          = aws_key_pair.deployer.key_name
  security_group_id = module.web_security.security_group_id
  instance_name     = "${var.project_name}-web-server"
  tags              = var.default_tags
}

# Get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}