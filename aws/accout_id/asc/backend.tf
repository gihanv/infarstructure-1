terraform {
  backend "s3" {
    bucket         = "exam-terraform-state"
    key            = "aws/account_id/asc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state"
    encrypt        = true
  }
}