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

variable "instance_id" {
  description = "The type of instance to use"
  type        = string
}

# Optional
variable "domain" {
  description = "The domain to use"
  type        = string
  default     = "vpc"
}
