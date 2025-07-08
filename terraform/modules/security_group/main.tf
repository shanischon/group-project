resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow web and restricted SSH access"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.open_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ingress.value == 22 ? [var.my_ip] : ["0.0.0.0/0"]
      description = ingress.value == 22 ? "SSH from my IP" : "Open port ${ingress.value} to the world"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "web-security-group"
  }
}
