
output "sg_id" {
  description = "aws ALB traget group ID"
  value       = aws_security_group.to_lb.id
}

