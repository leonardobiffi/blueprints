output "id" {
  description = "The ID of the service"
  value       = module.ecs_service.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.ecs_service.security_group_id
}

output "ecr_urls" {
  description = "The URLs of the ECR repositories"
  value       = module.ecs_service.ecr_urls
}
