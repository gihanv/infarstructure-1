resource "aws_s3_bucket" "s3_tf_state" {
  bucket = var.s3_bucket_name
  tags   = var.all_tags
}

resource "aws_s3_bucket_acl" "s3_acls" {
  bucket = var.s3_bucket_name
  acl    = var.s3_acl
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = var.s3_bucket_name
  versioning_configuration {
    status = var.s3_version
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encript" {
  bucket = var.s3_bucket_name

  rule {
    apply_server_side_encryption_by_default {

      sse_algorithm     = var.s3_server_side_encrypt == "default" ? "AES256" : "aws:kms"
      kms_master_key_id = var.s3_kms_arn
    }
  }
}