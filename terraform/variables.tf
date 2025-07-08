# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# EC2 Instance Variables
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (adjust as needed)
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "cloudify-ec2-instance"
}

# Tags
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "Cloudify"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

# Key Pair
variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default     = "cloudify-key"
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# Security Group
variable "sg_name" {
  description = "Name for the security group"
  type        = string
  default     = "cloudify-sg"
}

# Elastic IP
variable "create_eip" {
  description = "Whether to create and attach an Elastic IP"
  type        = bool
  default     = true
}

# Nginx Configuration
variable "nginx_html_content" {
  description = "HTML content for the Nginx default page"
  type        = string
  default     = "<html><body><h1>Welcome to Cloudify!</h1></body></html>"
}