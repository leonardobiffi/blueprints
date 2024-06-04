output "domain_identity_arn" {
  description = "The ARN of the SES domain identity"
  value       = module.ses.ses_domain_identity_arn
}

output "access_key_id" {
  description = "The access key ID"
  value       = module.ses.access_key_id
}

output "secret_access_key" {
  description = "The secret access key"
  value       = module.ses.secret_access_key
  sensitive   = true
}
