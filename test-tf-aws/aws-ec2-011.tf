resource "aws_security_group" "wiz-sar-test-smb" {
  name        = "wiz-sar-test-smb"
  description = "Allows incoming SMB access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow SMB from anywhere"
    from_port        = 445
    to_port          = 445
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

