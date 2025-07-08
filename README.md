# Cloudify - AWS Infrastructure Project

This project uses Terraform to provision AWS infrastructure for the Cloudify startup.

## Project Structure

The project is organized into several Terraform files, each responsible for a specific part of the infrastructure:

- `ec2.tf` - EC2 instance, key pair, and Elastic IP configuration
- `security-group.tf` - Security group configuration
- `ebs.tf` - EBS volume configuration
- `s3-bucket.tf` - S3 bucket configuration
- `outputs.tf` - Output values
- `variables.tf` - Variable definitions
- `terraform.tfvars` - Variable values

## Team Responsibilities

- **EC2 Service** (Yuval): EC2 instance, key pair, Elastic IP, Nginx installation
- **Smart Security Group**: Security group configuration
- **Separate EBS Volume**: EBS volume configuration and attachment
- **S3 Bucket**: S3 bucket configuration
- **Backend Shared State**: Terraform backend configuration

## Getting Started

### Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 1.0.0 or later)
- SSH key pair (default path: `~/.ssh/id_rsa.pub`)

### Initialization

```bash
cd terraform
terraform init
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

### Destroy

```bash
terraform destroy
```

## Outputs

After applying the Terraform configuration, you'll get the following outputs:

- `instance_id`: ID of the EC2 instance
- `instance_public_ip`: Public IP address of the EC2 instance
- `instance_private_ip`: Private IP address of the EC2 instance
- `instance_public_dns`: Public DNS name of the EC2 instance
- `website_url`: URL to access the Nginx website
- `ssh_command`: Command to SSH into the instance

## Notes

- The EC2 instance runs Nginx with a custom welcome page
- The instance is accessible via SSH using the specified key pair
- The instance has an Elastic IP attached for a static public IP address