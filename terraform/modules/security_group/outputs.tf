output "sg_public_id" {
  description = "aws ALB traget group ID"
  value       = aws_security_group.public.id
}

output "sg_pvt_id" {
  description = "aws ALB traget group ID"
  value       = aws_security_group.private.id
}
