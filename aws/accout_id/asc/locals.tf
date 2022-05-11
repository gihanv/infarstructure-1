locals {

  region           = "us-east-1"
  name             = "bestseller-asg"
  vpc_id           = "vpc-0774b5a6311a56ddb"
  pvt_sg_tag       = "private"
  desired_capacity = 1
  max_size         = 3
  min_size         = 1
  

  resource_tags = {
    "CreateFor" = "AutoScaleTest"
    "Managed"   = "Terraform"
  }


  default_tags = {
    Team       = "Devops"
    Department = "Bestseller-e"
    Account    = "Noneprod01"
  }





}