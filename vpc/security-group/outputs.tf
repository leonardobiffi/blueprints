output "id" {
  description = "The ID of the security group"
  value       = module.sg.security_group_id
}

output "name" {
  description = "The name of the security group"
  value       = module.sg.security_group_name
}

output "arn" {
  description = "The ARN of the security group"
  value       = module.sg.security_group_arn
}
