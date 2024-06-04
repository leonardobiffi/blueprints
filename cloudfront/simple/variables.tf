### Default variables for blueprints ###

# Required
variable "region" {
  type        = string
  description = "The AWS region to use"
}

variable "env" {
  type        = string
  description = "The environment to use"
}

variable "name" {
  description = "The name of the resource to create"
  type        = string
}

# Optional
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "system_tags" {
  description = "System tags to use. Automatically populated by the terragrunt."
  type        = map(string)
  default     = {}
}

### Variables for this blueprint ###

# Required
variable "origin" {
  description = "The origin to use in the CloudFront distribution"
  type        = any
}

variable "default_cache_behavior" {
  description = "The default cache behavior to use in the CloudFront distribution"
  type        = any
}

variable "domain_name" {
  description = "The domain name to use"
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}

# Optional
variable "minimum_protocol_version" {
  description = "The minimum protocol version to use"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "price_class" {
  description = "The price class to use"
  type        = string
  default     = "PriceClass_All"
}

variable "subdomain" {
  description = "The subdomain to use"
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "The default root object to use"
  type        = string
  default     = null
}

variable "ordered_cache_behavior" {
  description = "The ordered cache behavior to use in the CloudFront distribution"
  type        = list(any)
  default     = []
}

variable "origin_access_identities" {
  description = "The origin access identities to use"
  type        = map(string)
  default     = {}
}

variable "custom_error_response" {
  description = "One or more custom error response elements"
  type        = any
  default     = {}
}

variable "wait_for_deployment" {
  description = "Whether to wait for the deployment to complete"
  type        = bool
  default     = true
}

variable "web_acl_id" {
  description = "If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL."
  type        = string
  default     = null
}

variable "http_version" {
  description = "The HTTP version to use"
  type        = string
  default     = "http2"
}
