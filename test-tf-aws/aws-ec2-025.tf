resource "aws_security_group" "wiz-sar-test-mongodb" {
  name        = "wiz-sar-test-mongodb"
  description = "Allows incoming MongoDB access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow MongoDB from anywhere"
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

