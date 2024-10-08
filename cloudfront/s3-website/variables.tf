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
  description = "The name of the SNS topic to create"
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

# Optional
variable "default_root_object" {
  description = "The default root object to use"
  type        = string
  default     = "index.html"
}

variable "minimum_protocol_version" {
  description = "The minimum protocol version to use"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "subdomain" {
  description = "The subdomain to use"
  type        = string
  default     = null
}

variable "ordered_cache_behavior" {
  description = "The ordered cache behavior to use in the CloudFront distribution"
  type        = list(any)
  default     = []
}

variable "create_origin_access_identity" {
  description = "Whether to create an origin access identity"
  type        = bool
  default     = false
}

variable "s3_origin_buckets" {
  description = "The S3 origin buckets to use"
  type = list(object({
    id  = string
    arn = string
  }))
  default = []
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

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
  default     = null
}

variable "wait_for_deployment" {
  description = "Whether to wait for the deployment to complete"
  type        = bool
  default     = true
}
