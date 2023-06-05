resource "aws_security_group" "wiz-sar-test-vnc" {
  name        = "wiz-sar-test-vnc"
  description = "Allows incoming VNC access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow VNC from anywhere"
    from_port        = 5500
    to_port          = 5500
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

