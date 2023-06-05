resource "aws_security_group" "wiz-sar-test-smtp" {
  name        = "wiz-sar-test-smtp"
  description = "Allows incoming SMTP access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow SMTP from anywhere"
    from_port        = 25
    to_port          = 25
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

