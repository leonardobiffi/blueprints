output "id" {
  description = "The ID of the service"
  value       = module.ecs_service.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.ecs_service.security_group_id
}

output "repository_url" {
  description = "The URL of the ECR repository"
  value       = try(module.ecr.repository_url, null)
}
