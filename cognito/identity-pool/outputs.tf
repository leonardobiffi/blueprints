output "id" {
  description = "The ID of the identity pool"
  value       = aws_cognito_identity_pool.main.id
}

output "arn" {
  description = "The ARN of the identity pool"
  value       = aws_cognito_identity_pool.main.arn
}
