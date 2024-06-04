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

# Optional
variable "fullname" {
  description = "The full name of the resource to create without env prefix"
  type        = string
  default     = null
}

variable "path" {
  description = "The path to the role"
  type        = string
  default     = "/"
}

variable "custom_group_policy_arns" {
  description = "List of custom IAM policy ARNs to attach to the group"
  type        = list(string)
  default     = []
}

variable "attach_iam_self_management_policy" {
  description = "Whether to attach the IAMSelfManagement policy to the group"
  type        = bool
  default     = true
}

variable "enable_mfa_enforcement" {
  description = "Whether to enable MFA enforcement for the group"
  type        = bool
  default     = true
}
