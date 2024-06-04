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

variable "handler" {
  description = "The handler of the lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime of the lambda function"
  type        = string
}

variable "source_path" {
  description = "The source path of the function"
  type        = string
}

# Optional
variable "description" {
  description = "The description of the resource"
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "The environment variables of the lambda"
  type        = map(string)
  default     = {}
}

variable "allowed_triggers" {
  description = "The allowed triggers of the lambda"
  type        = map(any)
  default     = {}
}

variable "cloudwatch_logs_retention_in_days" {
  description = "The retention in days of the cloudwatch logs"
  type        = number
  default     = 7
}
