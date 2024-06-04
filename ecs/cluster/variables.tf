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

# Optional
variable "create_cloudwatch_log_group" {
  description = "Whether to create a CloudWatch log group for the cluster"
  type        = bool
  default     = false
}

variable "fargate_capacity_providers" {
  description = "Map of Fargate capacity provider definitions to use for the cluster"
  type        = any
  default     = {}
}

variable "autoscaling_capacity_providers" {
  description = "Map of autoscaling capacity provider definitions to create for the cluster"
  type        = any
  default     = {}
}

variable "container_insights" {
  description = "Whether to enable container insights. Valid values are enabled or disabled."
  type        = string
  default     = "disabled"
}

variable "default_capacity_provider" {
  description = "Whether to use the default capacity provider. Valid values are EC2 or FARGATE."
  type        = string
  default     = "FARGATE"
}
