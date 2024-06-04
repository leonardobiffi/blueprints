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
variable "comment" {
  description = "A comment to describe the cache policy"
  type        = string
  default     = "Managed by Terraform"
}

variable "cookies_config" {
  description = "The cookies to forward to the origin"
  type = object({
    cookie_behavior = optional(string, "none")
    items           = optional(list(string))
  })
  default = null
}

variable "headers_config" {
  description = "The headers to forward to the origin"
  type = object({
    header_behavior = optional(string, "none")
    items           = optional(list(string))
  })
  default = null
}

variable "query_strings_config" {
  description = "The query strings to forward to the origin"
  type = object({
    query_string_behavior = optional(string, "none")
    items                 = optional(list(string))
  })
  default = null
}
