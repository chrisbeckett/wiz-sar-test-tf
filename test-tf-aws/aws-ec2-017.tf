resource "aws_security_group" "wiz-sar-test-netbios" {
  name        = "wiz-sar-test-netbios"
  description = "Allows incoming NetBIOS access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow NetBIOS from anywhere"
    from_port        = 137
    to_port          = 138
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

