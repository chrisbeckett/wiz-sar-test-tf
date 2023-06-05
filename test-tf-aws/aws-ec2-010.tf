resource "aws_security_group" "wiz-sar-test-rpc" {
  name        = "wiz-sar-test-rpc"
  description = "Allows incoming RPC access from any internet address (SAR Testing, unattached)"
  vpc_id      = var.vpc-id

  ingress {
    description      = "Allow RPC from anywhere"
    from_port        = 135
    to_port          = 135
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

