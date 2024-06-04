output "s3_domain" {
  description = "The S3 domain name"
  value       = module.s3.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_arn" {
  description = "The S3 bucket ARN"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_id" {
  description = "The S3 bucket name"
  value       = module.s3.s3_bucket_id
}

output "s3_bucket_domain_name" {
  description = "The S3 bucket domain name"
  value       = module.s3.s3_bucket_bucket_domain_name
}

output "s3_bucket_website_endpoint" {
  description = "The S3 bucket regional domain name"
  value       = module.s3.s3_bucket_website_endpoint
}
