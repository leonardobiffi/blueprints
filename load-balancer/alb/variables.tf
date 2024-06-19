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
variable "vpc_id" {
  type        = string
  description = "The VPC ID to use"
}

variable "subnets" {
  type        = list(string)
  description = "The subnets to use"
}

# Optional
variable "security_group_ingress_rules" {
  type        = any
  description = "The ingress rules to use for the security group"
  default     = {}
}

variable "enable_deletion_protection" {
  description = "Boolean determining if the load balancer is protected from deletion."
  type        = bool
  default     = false
}

variable "target_groups" {
  type        = any
  description = "The target groups to use"
  default     = []
}

variable "listeners" {
  type        = any
  description = "Map of listener configurations to create"
  default     = []
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type `application`. Default: `60`"
  type        = number
  default     = null
}
