output "vpc_id" {
  description = "VPC ID"
  value       = var.vpc_id
}

output "security_group_id" {
  description = "Security group ID"
  value       = module.alb.security_group_id
}

output "arn" {
  description = "The ARN of the ELB"
  value       = module.alb.arn
}

output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.alb.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = module.alb.zone_id
}

output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = module.alb.listeners
}

output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = module.alb.target_groups
}
