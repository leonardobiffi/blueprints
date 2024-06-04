output "cluster_arn" {
  description = "Amazon Resource Name (ARN) of cluster"
  value       = module.aurora.cluster_arn
}

output "cluster_id" {
  description = "The RDS Cluster Identifier"
  value       = module.aurora.cluster_id
}

output "cluster_members" {
  description = "List of RDS Instances that are a part of this cluster"
  value       = module.aurora.cluster_members
}

output "cluster_endpoint" {
  description = "Writer endpoint for the cluster"
  value       = module.aurora.cluster_endpoint
}

output "cluster_reader_endpoint" {
  description = "A read-only endpoint for the cluster, automatically load-balanced across replicas"
  value       = module.aurora.cluster_reader_endpoint
}

output "cluster_port" {
  description = "The database port"
  value       = module.aurora.cluster_port
}

output "db_cluster_parameter_group_arn" {
  description = "The ARN of the DB cluster parameter group created"
  value       = module.aurora.db_cluster_parameter_group_arn
}

output "db_parameter_group_arn" {
  description = "The ARN of the DB parameter group created"
  value       = module.aurora.db_parameter_group_arn
}

output "cluster_master_user_secret" {
  description = "The secret containing the master user password"
  value       = module.aurora.cluster_master_user_secret
}
