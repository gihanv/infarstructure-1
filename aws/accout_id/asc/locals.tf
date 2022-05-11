locals {

  region           = "us-east-1"
  name             = "bestseller-asg"
  vpc_id           = "vpc-0092ae19a46988170"
  pvt_sg_tag       = "private"
  desired_capacity = 1
  max_size         = 3
  min_size         = 1
  lb_arn          = "arn:aws:elasticloadbalancing:us-east-1:724866671659:targetgroup/bestseller-autoscale-tg/da101d22ab268343"

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