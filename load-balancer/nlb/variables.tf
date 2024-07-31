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
  description = "The VPC ID to use"
  type        = string
}

variable "subnets" {
  description = "The subnets to use"
  type        = list(string)
}

# Optional
variable "listeners" {
  description = "Map of listener configurations to create"
  type        = any
  default     = {}
}

variable "target_groups" {
  type        = any
  description = "The target groups to use"
  default     = []
}

variable "security_group_ingress_rules" {
  type        = any
  description = "The ingress rules to use for the security group"
  default     = {}
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "attach_ip" {
  description = "Whether or not to attach an IP to the load balancer"
  type        = bool
  default     = false
}
