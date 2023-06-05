resource "aws_security_group" "wiz-sar-test-oracle" {
  name        = "wiz-sar-test-oracle"
  description = "Allows incoming Oracle access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow Oracle from anywhere"
    from_port        = 1521
    to_port          = 1521
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

