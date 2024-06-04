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

variable "name" {
  description = "The name of the resource"
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

# Optional
variable "value" {
  description = "The value of the parameter"
  type        = string
  default = null
}

variable "values" {
  description = "The values of the parameter"
  type        = list(string)
  default     = []
}

variable "secure_type" {
  description = "The type of the parameter"
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the parameter"
  type        = string
  default     = null
}
