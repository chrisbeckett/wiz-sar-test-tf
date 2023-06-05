resource "aws_security_group" "wiz-sar-test-mysql" {
  name        = "wiz-sar-test-mysql"
  description = "Allows incoming MySQL access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow MySQL from anywhere"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

