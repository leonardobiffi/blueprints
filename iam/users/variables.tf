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
variable "users" {
  description = "A list of users to create"
  type = map(object({
    create_iam_user_login_profile = bool
    create_iam_access_key         = optional(bool, false)
    policy_arns                   = optional(list(string), [])
    groups                        = optional(list(string), [])
  }))
}
