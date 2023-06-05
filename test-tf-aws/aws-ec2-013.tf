resource "aws_security_group" "wiz-sar-test-ftp" {
  name        = "wiz-sar-test-ftp"
  description = "Allows incoming FTP access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow FTP from anywhere"
    from_port        = 21
    to_port          = 21
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

