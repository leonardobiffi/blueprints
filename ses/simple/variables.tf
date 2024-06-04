# Required

variable "region" {
  type        = string
  description = "The AWS region to use"
}

variable "name" {
  type        = string
  description = "The name prefix of the resource"
}

variable "env" {
  type        = string
  description = "The environment to use"
}

variable "domain" {
  type        = string
  description = "The domain to use"
}

variable "zone_id" {
  type        = string
  description = "The zone ID of the domain"
}

# Optional
variable "verify_dkim" {
  type        = bool
  description = "Whether to verify the DKIM records"
  default     = true
}

variable "verify_domain" {
  type        = bool
  description = "Whether to verify the domain"
  default     = true
}

variable "ses_user_enabled" {
  type        = bool
  description = "Whether to create the SES user"
  default     = false
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}

variable "system_tags" {
  description = "System tags to use. Automatically populated by the terragrunt."
  type        = map(string)
  default     = {}
}
