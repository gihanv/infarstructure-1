locals {

  region   = "us-east-1"
  asg_name = "bestseller-asg"
  vpc_id   = "vpc-0774b5a6311a56ddb"
  lb_name  =  "bestseller-autoscale"
  lb_target_name = "bestsellet-alb-target-group"


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