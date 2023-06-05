resource "aws_security_group" "wiz-sar-test-mssql-browser" {
  name        = "wiz-sar-test-mssql-browser"
  description = "Allows incoming MS-SQL Browser access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow MS-SQL Browser from anywhere"
    from_port        = 1434
    to_port          = 1434
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

