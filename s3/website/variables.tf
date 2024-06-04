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
  description = "The name of the SNS topic to create"
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

# Optional
variable "index_document" {
  description = "The index document to use"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The error document to use"
  type        = string
  default     = "error.html"
}

variable "cors_rule" {
  description = "The CORS rule to use"
  type        = list(any)
  default     = []
}
