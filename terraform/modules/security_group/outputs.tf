output "security_group_id" {
  description = "The ID of the web security group"
  value       = aws_security_group.web_sg.id
}
