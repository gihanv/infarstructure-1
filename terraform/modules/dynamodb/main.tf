resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
  name           = var.dd_table_name
  hash_key       = var.dd_hash_key
  read_capacity  = var.dd_read_capacity
  write_capacity = var.dd_write_capacity

  attribute {
    name = var.dd_attributes_name
    type = var.dd_attributes_type
  }

  tags = var.all_tags

}
