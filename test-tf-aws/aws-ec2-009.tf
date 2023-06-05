resource "aws_security_group" "wiz-sar-test-vnc-server" {
  name        = "wiz-sar-test-vnc-server"
  description = "Allows incoming VNC Server access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow VNC Server from anywhere"
    from_port        = 5800
    to_port          = 5800
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Allow VNC Server from anywhere"
    from_port        = 5900
    to_port          = 5900
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

