output "arn" {
  description = "ARN of IAM role"
  value       = module.eks_role.iam_role_arn
}

output "name" {
  description = "Name of IAM role"
  value       = module.eks_role.iam_role_name
}
