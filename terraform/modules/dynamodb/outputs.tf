output "dynamodb_table_arn" {

  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.dynamodb-terraform-lock.arn
}

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.dynamodb-terraform-lock.id
}