# Security Group - Placeholder
# This file will be implemented by the teammate responsible for "Smart Security Group"

# Basic security group for EC2 instance
# This is a minimal implementation that will be enhanced by the teammate
resource "aws_security_group" "cloudify_sg" {
  name        = var.sg_name
  description = "Allow HTTP, HTTPS and SSH traffic"

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  # HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access"
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    var.tags,
    {
      Name = var.sg_name
    }
  )

  # Comment for teammate:
  # This is a basic security group implementation.
  # Please enhance this with your "Smart Security Group" implementation.
  # Consider adding more specific rules, using security group references instead of CIDR blocks,
  # implementing dynamic blocks for rules, etc.
}