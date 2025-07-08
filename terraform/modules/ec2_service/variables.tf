variable "instance_type" {
  description = "The instance type for the EC2 instance (free tier: t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for SSH access"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to attach to the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "cloudify-web-server"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 8
}

variable "ebs_volume_type" {
  description = "Type of the EBS volume (gp2 is free tier eligible)"
  type        = string
  default     = "gp2"
}

variable "availability_zone" {
  description = "The AZ where the instance and EBS volume will be created"
  type        = string
  default     = null
}