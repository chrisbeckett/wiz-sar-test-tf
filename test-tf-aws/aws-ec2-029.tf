resource "aws_instance" "wiz-sar-test-ec2" {
  ami           = "ami-04f7efe62f419d9f5"
  instance_type = "t2.micro"

  tags = {
    Name = "Wiz SAR Test EC2 instance"
  }
}
