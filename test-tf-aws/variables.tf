terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "=5.0.1"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
   region = "eu-west-1" 
}
variable "vpc-id" {
   type = string
   description = "ID of the VPC where you want to create the test Security Groups"
   default = "vpc-xxxxxxxxxxxxx"
}

