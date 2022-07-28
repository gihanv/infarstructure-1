locals {

  region = "us-east-1"


  bucket_name    = "exam-terraform-state"
  side_encrypt   = "default"
  kms_arn        = ""
  dynamodb_table = "terraform-state"


  resource_tags = {
    "CreateFor" = "S3BackendTest"
    "Managed"   = "Terraform"
  }


  default_tags = {
    Team       = "Devops"
    Department = "Bestseller-e"
    Account    = "Noneprod01"
  }





}