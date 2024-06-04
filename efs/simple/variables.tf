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

# Required
variable "mount_targets" {
  description = "The mount targets for the EFS file system"
  type        = any
}

variable "vpc_id" {
  description = "The VPC ID to use"
  type        = string
}

# Optional
variable "lifecycle_policy" {
  description = "The lifecycle policy for the EFS file system"
  type        = map(string)
  default     = {}
}

variable "security_group_rules" {
  description = "Map of security group rule definitions to create"
  type        = any
  default     = {}
}

variable "access_points" {
  description = "A map of access point definitions to create"
  type        = any
  default     = {}
}

variable "policy_statements" {
  description = "A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = []
}
