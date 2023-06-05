variable "region" {
  type    = string
  default = "North Europe"
}

variable "resource_group_name" {
    type = string
    default = "wiz-sar-test-rg"
}

variable "my_ip_address" {
    type = string
    default = "8.8.8.8"
    description = "The public IP of the endpoint where the Terraform scripts are run from (for network rules)"
}