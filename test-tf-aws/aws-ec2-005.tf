resource "aws_security_group" "wiz-sar-test-telnet" {
  name        = "wiz-sar-test-telnet"
  description = "Allows incoming Telnet access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow Telnet from anywhere"
    from_port        = 23
    to_port          = 23
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

