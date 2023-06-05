module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "wiz-sar-test-http"
  description = "Allows HTTP access to any internet address (SAR Testing, unattached)"
  vpc_id      =  var.vpc-id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
