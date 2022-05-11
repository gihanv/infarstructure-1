locals {

  region = "us-east-1"

  lt_vpc_id            = "vpc-0092ae19a46988170"
  aim_profile_name     = "bestseller-exam"
  launch_template_name = "lt_apache2"
  nginx_version        = "focal "
  instance_type        = "t2.micro"
  instance_id          = "ami-0c4f7023847b90238"
  shutdown_behavior    = "terminate"
  key_name             = "bestseller"

  resource_tags = {
    "CreateFor" = "LauchtemplateTest"
    "Managed"   = "Terraform"
  }


  default_tags = {
    Team       = "Devops"
    Department = "Bestseller-e"
    Account    = "Noneprod01"
  }





}