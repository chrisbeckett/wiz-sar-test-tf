resource "aws_security_group" "wiz-sar-test-ftp-data" {
  name        = "wiz-sar-test-ftp-data"
  description = "Allows incoming FTP data access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow FTP data from anywhere"
    from_port        = 20
    to_port          = 20
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

