output "name" {
  description = "Name of the repository"
  value       = module.ecr.repository_name
}

output "arn" {
  description = "Full ARN of the repository"
  value       = module.ecr.repository_arn
}

output "registry_id" {
  description = "The registry ID where the repository was created"
  value       = module.ecr.repository_registry_id
}

output "url" {
  description = "The URL of the repository"
  value       = module.ecr.repository_url
}
