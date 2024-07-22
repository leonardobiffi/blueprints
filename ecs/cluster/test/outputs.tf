output "id" {
  description = "ID that identifies the cluster"
  value       = module.ecs_cluster.id
}

output "name" {
  description = "Name that identifies the cluster"
  value       = module.ecs_cluster.name
}

output "arn" {
  description = "ARN that identifies the cluster"
  value       = module.ecs_cluster.arn
}

output "capacity_providers" {
  description = "Map of cluster capacity providers attributes"
  value       = module.ecs_cluster.capacity_providers
}
