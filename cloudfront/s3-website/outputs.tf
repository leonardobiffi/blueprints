output "cloudfront_domain" {
  description = "The CloudFront domain name"
  value       = module.cloudfront.cloudfront_distribution_domain_name
}

output "cloudfront_id" {
  description = "The CloudFront ID"
  value       = module.cloudfront.cloudfront_distribution_id
}

output "cloudfront_arn" {
  description = "The CloudFront ARN"
  value       = module.cloudfront.cloudfront_distribution_arn
}

output "cloudfront_zone_id" {
  description = "The CloudFront Hosted Zone ID"
  value       = module.cloudfront.cloudfront_distribution_hosted_zone_id
}
