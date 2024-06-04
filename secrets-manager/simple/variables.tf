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
variable "secret_string" {
  type        = string
  description = "The secret keys to use"
  default     = null
}

variable "ignore_secret_changes" {
  type        = bool
  description = "Whether to ignore secret changes"
  default     = false
}

variable "description" {
  type        = string
  description = "The description of the secret"
  default     = null
}

variable "create_policy" {
  type        = bool
  description = "Whether to create a policy for the secret"
  default     = false
}

variable "block_public_policy" {
  type        = bool
  description = "Whether to block public policy for the secret"
  default     = false
}

variable "policy_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = map(any)
  default     = {}
}
