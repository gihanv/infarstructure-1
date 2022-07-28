locals {

  region = "us-east-1"

  vpc_name            = "bestseller-dev"
  vpc_cidr            = "10.0.0.0/16"
  vpc_azs             = ["us-east-1a", "us-east-1b"]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]

  resource_tags = {
    "CreateFor" = "VpcTest" # use unique Name for this tag 
    "Managed"   = "Terraform"
  }


  default_tags = {
    Team       = "Devops"
    Department = "Bestseller-e"
    Account    = "Noneprod01"
  }





}