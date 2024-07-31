output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "Public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnets"
  value       = module.vpc.private_subnets
}

output "database_subnets" {
  description = "Database subnets"
  value       = module.vpc.database_subnets
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.igw_id
}
