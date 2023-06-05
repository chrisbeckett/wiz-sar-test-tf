resource "aws_security_group" "wiz-sar-test-rdp" {
  name        = "wiz-sar-test-rdp"
  description = "Allows incoming RDP access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow RDP from anywhere"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

