resource "aws_security_group" "wiz-sar-test-msql" {
  name        = "wiz-sar-test-msql"
  description = "Allows incoming MiniSQL access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow MiniSQL from anywhere"
    from_port        = 4333
    to_port          = 4333
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

