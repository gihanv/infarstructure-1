output "dynamodb_table_arn" {

  description = "  	ARN of the DynamoDB table"
  value       = module.backend_dynamodb.dynamodb_table_arn
}

output "dynamodb_table_id" {
  description = " 	ID of the DynamoDB table"
  value       = module.backend_dynamodb.dynamodb_table_id
}


output "s3_bucket_arn" {

  description = " 	The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.backend_s3.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.backend_s3.s3_bucket_bucket_domain_name
}

output "s3_bucket_id" {
  description = "The name of the bucket.."
  value       = module.backend_s3.s3_bucket_id
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = module.backend_s3.s3_bucket_region
}
