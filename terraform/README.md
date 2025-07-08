# Cloudify Infrastructure

This repository contains the Terraform configuration for the Cloudify infrastructure project.

## Project Structure

```
cloudify-infra/
├── main.tf       # Main file to call our modules
├── variables.tf  # Global variables for the whole project
├── outputs.tf    # Global outputs from our modules
├── backend.tf    # Configuration for our shared state
└── modules/
    ├── ec2_service/
    │   ├── main.tf     # Defines EC2, EBS, and Elastic IP
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security_group/
    │   ├── main.tf     # Defines the security group rules
    │   ├── variables.tf
    │   └── outputs.tf
    └── s3_bucket/
        ├── main.tf     # Defines the S3 bucket for backups
        ├── variables.tf
        └── outputs.tf
```

## Modules

### EC2 Service
Handles the creation and configuration of EC2 instances, EBS volumes, and Elastic IPs.

### Security Group
Manages security group rules for the infrastructure.

### S3 Bucket
Configures S3 buckets for backups and other storage needs.

## Usage

1. Initialize Terraform:
```
terraform init
```

2. Plan the deployment:
```
terraform plan
```

3. Apply the configuration:
```
terraform apply
```

4. To destroy the infrastructure:
```
terraform destroy
```
