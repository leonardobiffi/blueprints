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
variable "name" {
  description = "The name of the resource to create"
  type        = string
  default     = null
}

variable "policy_statements" {
  description = "Policy Statements"
  type = list(object({
    sid         = optional(string)
    effect      = string
    actions     = optional(list(string))
    not_actions = optional(list(string))
    resources   = list(string)
    conditions = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
  }))
  default = []
}

# Optional
variable "fullname" {
  description = "The full name of the resource to create without env prefix"
  type        = string
  default     = null
}

variable "path" {
  description = "The path to the policy"
  type        = string
  default     = "/"
}
