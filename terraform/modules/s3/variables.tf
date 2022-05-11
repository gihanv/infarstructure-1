variable "s3_bucket_name" {
  type        = string
  default     = "null"
  description = "S3 bucket name"
}

variable "s3_acl" {
  type        = string
  default     = "private"
  description = "S3 acl public, private, default value is private"
}

variable "s3_version" {
  type        = string
  default     = "false"
  description = "S3 versioning , default value is false"

}

variable "res_tags" {
  type = map(string)
  default = {
    "TestFrot" = "EC2",
    "Mangaged" = "Terraform"
  }
}

variable "s3_server_side_encrypt" {
  type        = string
  default     = "null"
  description = "if you want to use KMS pass some string"

}

variable "s3_kms_arn" {
  type        = string
  description = "If you use KMS for encrypt s3 use the key arn "
  default     = ""

}

variable "all_tags" {
  type = map(string)

}

