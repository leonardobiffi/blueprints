output "id" {
  description = "The ID of the namespace"
  value       = local.private_namespace ? aws_service_discovery_private_dns_namespace.main[0].id : aws_service_discovery_public_dns_namespace.main[0].id
}

output "arn" {
  description = "The ARN of the namespace"
  value       = local.private_namespace ? aws_service_discovery_private_dns_namespace.main[0].arn : aws_service_discovery_public_dns_namespace.main[0].arn
}
