# ------------------------------------------------------------------
# │ File:    outputs.tf (Root)                                     │
# │ Author:  Member 4 (Project Integrator)                         │
# │ Branch:  feature/outputs                                       │
# │ Purpose: Exposes key information from the modules after deploy.│
# ------------------------------------------------------------------

output "server_public_ip" {
  description = "The public IP address of the deployed EC2 web server."
  # This value comes from the 'ec2_service' module, which Member 1 is creating.
  value = module.app_server.public_ip
}

output "volume_id" {
  description = "The ID of the EBS volume attached to the web server."
  # This value also comes from the 'ec2_service' module.
  value = module.app_server.volume_id
}

output "bucket_name" {
  description = "The unique name of the S3 bucket created for backups."
  # This value comes from the 's3_bucket' module, which Member 2 is creating.
  value = module.backups.bucket_name
}

output "key_pair_name" {
  description = "The name of the Key Pair created for SSH access."
  # This value comes from the 'aws_key_pair' resource that Member 5 will create in the root main.tf.
  value = aws_key_pair.deployer.key_name
}

output "server_public_dns" {
  description = "The public DNS address of the EC2 web server."
  # This value also comes from the 'ec2_service' module.
  value = module.app_server.public_dns
}
