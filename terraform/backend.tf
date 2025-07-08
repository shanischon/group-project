# ------------------------------------------------------------------
# │ File:    backend.tf                                          │
# │ Author:  Member 5 (Composer)                                 │
# │ Branch:  feature/root-main                                   │
# │ Purpose: Configure remote state management with S3 & DynamoDB │
# ------------------------------------------------------------------

terraform {
  backend "s3" {
    # NOTE: This is commented out for the exercise to avoid creating actual AWS resources
    # In a real project, you would uncomment and configure these values
    
    # bucket         = "cloudify-terraform-state"
    # key            = "terraform.tfstate"
    # region         = "us-east-1"
    # dynamodb_table = "cloudify-terraform-locks"
    # encrypt        = true
  }
}