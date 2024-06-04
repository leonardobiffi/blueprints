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
  description = "The name of the resource"
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

# Optional
variable "api_gateway_version" {
  description = "The API Gateway version to use. Valid values are `v1` and `v2`"
  type        = string
  default     = "v1"
}

variable "target_arn" {
  description = "The target ARN of the Network Load Balancer to use"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "The security group IDs to use"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "The subnet IDs to use"
  type        = list(string)
  default     = []
}
