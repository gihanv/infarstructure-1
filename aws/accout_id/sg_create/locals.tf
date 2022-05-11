locals {

  region = "us-east-1"
  vpc_id = "vpc-0092ae19a46988170"
  alb_arn = "234"

  resource_tags = {
    "CreateFor" = "ALBTest"
    "Managed"   = "Terraform"
  }


  default_tags = {
    Team       = "Devops"
    Department = "Bestseller-e"
    Account    = "Noneprod01"
  }


}