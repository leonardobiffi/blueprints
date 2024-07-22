output "arn" {
  description = "ARN of IAM role"
  value       = module.eks_role.arn
}

output "name" {
  description = "Name of IAM role"
  value       = module.eks_role.name
}
