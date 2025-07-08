# AWS Provider Configuration
provider "aws" {
  region = var.aws_region
}

# Create a key pair for SSH access
resource "aws_key_pair" "cloudify_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
  tags       = var.tags
}

# EC2 Instance
resource "aws_instance" "cloudify_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.cloudify_key.key_name
  
  # Reference to security group (implemented by teammate)
  # This assumes the security group will be created in security-group.tf
  security_groups = [var.sg_name]
  
  user_data = <<-EOF
    #!/bin/bash
    # Update system packages
    yum update -y
    
    # Install Nginx
    amazon-linux-extras install nginx1 -y
    systemctl start nginx
    systemctl enable nginx
    
    # Create custom index.html
    cat > /usr/share/nginx/html/index.html << 'HTMLCONTENT'
    ${var.nginx_html_content}
    HTMLCONTENT
    
    # Restart Nginx to apply changes
    systemctl restart nginx
  EOF
  
  tags = merge(
    var.tags,
    {
      Name = var.instance_name
    }
  )
  
  # Lifecycle policy to prevent accidental destruction
  lifecycle {
    create_before_destroy = true
  }
}

# Elastic IP
resource "aws_eip" "cloudify_eip" {
  count = var.create_eip ? 1 : 0
  tags  = var.tags
}

# Associate Elastic IP with EC2 instance
resource "aws_eip_association" "cloudify_eip_assoc" {
  count         = var.create_eip ? 1 : 0
  instance_id   = aws_instance.cloudify_instance.id
  allocation_id = aws_eip.cloudify_eip[0].id
}