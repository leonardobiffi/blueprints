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
variable "domain_name" {
  description = "The domain name to use"
  type        = string
}

# Optional
variable "zone_id" {
  description = "The zone ID to use"
  type        = string
  default     = ""
}

variable "subject_alternative_names" {
  description = "The subject alternative names to use"
  type        = list(any)
  default     = []
}

variable "wait_for_validation" {
  description = "Whether to wait for validation"
  type        = bool
  default     = true
}

variable "private_zone" {
  description = "Whether to use a private zone"
  type        = bool
  default     = false
}

variable "validate_certificate" {
  description = "Whether to validate certificate by creating Route53 record"
  type        = bool
  default     = true
}

variable "create_route53_records" {
  description = "When validation is set to DNS, define whether to create the DNS records internally via Route53 or externally using any DNS provider"
  type        = bool
  default     = true
}
