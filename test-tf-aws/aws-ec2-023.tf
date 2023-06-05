resource "aws_security_group" "wiz-sar-test-high-ports" {
  name        = "wiz-sar-test-high-ports"
  description = "Allows incoming high port (above 1024) access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow high ports from anywhere"
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

