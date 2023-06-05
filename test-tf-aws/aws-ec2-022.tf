resource "aws_security_group" "wiz-sar-test-icmp" {
  name        = "wiz-sar-test-icmp"
  description = "Allows incoming ICMP access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow ICMP from anywhere"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

