output "id" {
  description = "The id of the user pool"
  value       = module.cognito_user_pool.id
}

output "arn" {
  description = "The ARN of the user pool"
  value       = module.cognito_user_pool.arn
}

output "endpoint" {
  description = "The endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = module.cognito_user_pool.endpoint
}

output "name" {
  description = "The name of the user pool"
  value       = module.cognito_user_pool.name
}

# aws_cognito_user_pool_domain
output "domain_aws_account_id" {
  description = "The AWS account ID for the user pool owner"
  value       = module.cognito_user_pool.domain_aws_account_id
}

output "domain_cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = module.cognito_user_pool.domain_cloudfront_distribution_arn
}

output "domain_s3_bucket" {
  description = "The S3 bucket where the static files for this domain are stored"
  value       = module.cognito_user_pool.domain_s3_bucket
}

output "domain_app_version" {
  description = "The app version"
  value       = module.cognito_user_pool.domain_app_version
}

# aws_cognito_user_pool_client
output "client_ids" {
  description = "The ids of the user pool clients"
  value       = module.cognito_user_pool.client_ids
}

output "client_secrets" {
  description = "The client secrets of the user pool clients"
  value       = module.cognito_user_pool.client_secrets
  sensitive   = true
}

output "client_ids_map" {
  description = "The ids map of the user pool clients"
  value       = module.cognito_user_pool.client_ids_map
}

output "client_secrets_map" {
  description = "The client secrets map of the user pool clients"
  value       = module.cognito_user_pool.client_secrets_map
  sensitive   = true
}

# aws_cognito_resource_servers
output "resource_servers_scope_identifiers" {
  description = " A list of all scopes configured in the format identifier/scope_name"
  value       = module.cognito_user_pool.resource_servers_scope_identifiers
}
