output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group"
  value       = aws_lb_target_group.main[*].arn
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group"
  value       = aws_lb_target_group.main[*].name
}

output "target_group_arns_by_service_tag" {
  description = "A map of target group names by tag service"
  value       = local.target_group_arns_by_service_tag
}

output "target_group_attachments" {
  description = "ARNs of the target group attachment IDs"
  value       = { for k, v in aws_lb_target_group_attachment.this : k => v.id }
}
