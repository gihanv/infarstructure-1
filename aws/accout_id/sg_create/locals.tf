locals {

  region   = "us-east-1"
  vpc_id   = "vpc-0774b5a6311a56ddb"


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