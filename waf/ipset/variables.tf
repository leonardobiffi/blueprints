### Default variables for blueprints ###

# Required
variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

# Optional
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

### Variables for this blueprint ###

# Required
variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "scope" {
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application"
  type        = string
}

variable "addresses" {
  description = "The list of IP addresses in CIDR notation"
  type        = list(string)
}

# Optional
variable "description" {
  description = "The description of the IP set"
  type        = string
  default     = "Managed by Terraform"
}

variable "ip_address_version" {
  description = "The IP address version of the IP set"
  type        = string
  default     = "IPV4"
}
