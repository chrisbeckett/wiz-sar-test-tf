resource "aws_security_group" "wiz-sar-test-mssql" {
  name        = "wiz-sar-test-mssql"
  description = "Allows incoming MS-SQL access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow MS-SQL from anywhere"
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

