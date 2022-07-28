terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 0.13"
    }
  }
}

provider "aws" {
  # Configuration options
  region = local.region
}
