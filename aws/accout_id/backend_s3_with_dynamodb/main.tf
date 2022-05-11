
module "backend_s3" {

  source = "../../../terraform/modules/s3/"

  s3_bucket_name         = local.bucket_name
  s3_acl                 = "private"
  s3_version             = "Enabled"
  s3_server_side_encrypt = local.side_encrypt
  s3_kms_arn             = local.kms_arn
  all_tags               = merge(local.resource_tags, local.default_tags)

}

module "backend_dynamodb" {

  source = "../../../terraform/modules/dynamodb/"

  dd_table_name      = local.dynamodb_table
  dd_hash_key        = "LockID"
  dd_attributes_name = "LockID"
  dd_attributes_type = "S"
  dd_read_capacity   = 20
  dd_write_capacity  = 20

  all_tags = merge(local.resource_tags, local.default_tags)

}