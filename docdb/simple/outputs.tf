output "cluster_name" {
  description = "Cluster Identifier"
  value       = module.documentdb.cluster_name
}

output "arn" {
  description = "Amazon Resource Name (ARN) of the cluster"
  value       = module.documentdb.arn
}

output "endpoint" {
  description = "Endpoint of the DocumentDB cluster"
  value       = module.documentdb.endpoint
}

output "reader_endpoint" {
  description = "A read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
  value       = module.documentdb.reader_endpoint
}

output "security_group_id" {
  description = "ID of the DocumentDB cluster Security Group"
  value       = module.documentdb.security_group_id
}
