output "web_acl_arn" {
  description = "The ARN of the WAF WebACL"
  value       = module.waf.web_acl_arn
}

output "web_acl_name" {
  description = "The name of the WAF WebACL"
  value       = module.waf.web_acl_name
}
