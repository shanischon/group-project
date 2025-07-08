# AWS Region
aws_region = "us-east-1"

# EC2 Instance
instance_type = "t2.micro"
ami_id       = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (adjust as needed)
instance_name = "cloudify-ec2-instance"

# Tags
tags = {
  Project     = "Cloudify"
  Environment = "Development"
  ManagedBy   = "Terraform"
  Owner       = "Yuval"
  Service     = "EC2"
}

# Key Pair
key_name = "cloudify-key"
public_key_path = "~/.ssh/id_rsa.pub"

# Security Group
sg_name = "cloudify-sg"

# Elastic IP
create_eip = true

# Nginx Configuration
nginx_html_content = <<EOF
<html>
<head>
  <title>Welcome to Cloudify</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f0f8ff;
    }
    .container {
      text-align: center;
      padding: 2rem;
      border-radius: 10px;
      background-color: white;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #0066cc;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Welcome to Cloudify!</h1>
    <p>Your EC2 instance is running successfully.</p>
    <p>Powered by Terraform</p>
  </div>
</body>
</html>
EOF