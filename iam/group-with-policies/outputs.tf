output "arn" {
  description = "The ARN of the IAM group"
  value = module.iam_group.group_arn
}

output "name" {
  description = "The name of the IAM group"
  value = module.iam_group.group_name
}
