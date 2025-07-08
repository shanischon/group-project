# ------------------------------------------------------------------
# │ File:    variables.tf (Root)                                   │
# │ Author:  Member 4 (Project Integrator)                         │
# │ Branch:  feature/outputs                                       │
# │ Purpose: Defines global variables for the entire project.      │
# ------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region where all resources will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project. This will be used to prefix resource names."
  type        = string
  default     = "cloudify"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch for the web server."
  type        = string
  default     = "t2.micro" # As per the project requirements
}

variable "ssh_allowed_cidrs" {
  description = "A list of CIDR blocks allowed to connect via SSH to the EC2 instance."
  type        = list(string)
  default     = ["0.0.0.0/0"] # WARNING: This is open to the world. Replace with your IP for production.
}

variable "default_tags" {
  description = "A map of default tags to apply to all taggable resources."
  type        = map(string)
  default = {
    "Project"   = "Cloudify"
    "ManagedBy" = "Terraform"
    "Team"      = "DevOps-Group-Exercise"
  }
}