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
  type        = string
  description = "The name of the namespace"
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

# Optional
variable "description" {
  type        = string
  description = "The description of the namespace"
  default     = null
}

variable "namespace_type" {
  type        = string
  description = "The type of the namespace. Valid values are PUBLIC or PRIVATE"
  default     = "PRIVATE"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to use. Required if namespace_type is PRIVATE"
  default     = null
}
