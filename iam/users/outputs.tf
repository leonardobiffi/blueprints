output "iam_users" {
  description = "The user's name"
  value       = module.iam_user
  sensitive   = true
}
