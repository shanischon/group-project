variable "vpc_id" {
  description = "The ID of the VPC to associate the security group with"
  type        = string
}

variable "my_ip" {
  description = "Your IP address allowed for SSH"
  type        = string
}

variable "open_ports" {
  description = "List of allowed inbound ports"
  type        = list(number)
  default     = [22, 80, 443]
}
