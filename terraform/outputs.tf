# EC2 Instance ID
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.cloudify_instance.id
}

# EC2 Instance Public IP
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = var.create_eip ? aws_eip.cloudify_eip[0].public_ip : aws_instance.cloudify_instance.public_ip
}

# EC2 Instance Private IP
output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.cloudify_instance.private_ip
}

# EC2 Public DNS
output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = var.create_eip ? aws_eip.cloudify_eip[0].public_dns : aws_instance.cloudify_instance.public_dns
}

# Nginx Website URL
output "website_url" {
  description = "URL to access the Nginx website"
  value       = "http://${var.create_eip ? aws_eip.cloudify_eip[0].public_dns : aws_instance.cloudify_instance.public_dns}"
}

# SSH Connection Command
output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i ${replace(var.public_key_path, ".pub", "")} ec2-user@${var.create_eip ? aws_eip.cloudify_eip[0].public_dns : aws_instance.cloudify_instance.public_dns}"
}