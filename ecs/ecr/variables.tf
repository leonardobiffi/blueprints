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
variable "repository_type" {
  description = "The type of repository to create. Either `public` or `private`"
  type        = string
  default     = "private"
}

variable "repository_lifecycle_policy" {
  description = "The lifecycle policy to apply to the repository"
  type        = any
  default     = null 
}

variable "repository_image_tag_mutability" {
  description = "The image tag mutability setting for the repository"
  type        = string
  default     = "IMMUTABLE"
}

variable "repository_policy" {
  description = "The policy to apply to the repository"
  type        = string
  default     = null 
}
