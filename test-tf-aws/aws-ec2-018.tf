resource "aws_security_group" "wiz-sar-test-postgresql" {
  name        = "wiz-sar-test-postgresql"
  description = "Allows incoming PostgreSQL access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow PostgreSQL from anywhere"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

