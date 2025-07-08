# EC2 Instance
resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  availability_zone      = var.availability_zone

  user_data = <<-EOF
    #!/bin/bash
    # Update system packages
    apt-get update -y || yum update -y
    
    # Install Nginx
    apt-get install -y nginx || yum install -y nginx
    
    # Start Nginx and enable it to start on boot
    systemctl start nginx
    systemctl enable nginx
    
    # Create a simple welcome page
    cat > /var/www/html/index.html << 'HTMLCONTENT'
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
    HTMLCONTENT
  EOF

  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )

  # Wait for the instance to be created before creating the EBS volume
  lifecycle {
    create_before_destroy = true
  }
}

# EBS Volume
resource "aws_ebs_volume" "web_server_data" {
  availability_zone = aws_instance.web_server.availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type

  tags = merge(
    {
      Name = "${var.instance_name}-data"
    },
    var.tags
  )
}

# Volume Attachment
resource "aws_volume_attachment" "web_server_data_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.web_server_data.id
  instance_id = aws_instance.web_server.id

  # Make sure the attachment is destroyed before the volume is destroyed
  stop_instance_before_detaching = true
}