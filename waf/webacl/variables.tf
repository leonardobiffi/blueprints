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
variable "alb_arn" {
  description = "The ARN of the ALB to associate the WAF with"
  type        = string
  default     = null
}

variable "scope" {
  description = "The scope of the WAF"
  type        = string
  default     = "REGIONAL"
}

variable "allow_default_action" {
  description = "Whether to allow the default action"
  type        = bool
  default     = true
}

variable "rules" {
  description = "The rules to use"
  type        = any
  default     = []
}

variable "description" {
  description = "The description of the WAF"
  type        = string
  default     = ""
}

variable "create_logging_configuration" {
  description = "Whether to create a logging configuration"
  type        = bool
  default     = false
}

variable "cloudwatch_log_retention_days" {
  description = "The number of days to retain the logs in CloudWatch"
  type        = number
  default     = 7
}

variable "redacted_fields" {
  // TODO: change to list object
  type = map(object({
    method        = optional(bool, false)
    uri_path      = optional(bool, false)
    query_string  = optional(bool, false)
    single_header = optional(list(string), null)
  }))
  default = {
    method = {
      method = true
    }
    uri_path = {
      uri_path = true
    }
    query_string = {
      query_string = true
    }
  }
  description = <<-DOC
    The parts of the request that you want to keep out of the logs.
    You can only specify one of the following: `method`, `query_string`, `single_header`, or `uri_path`

    method:
      Whether to enable redaction of the HTTP method.
      The method indicates the type of operation that the request is asking the origin to perform.
    uri_path:
      Whether to enable redaction of the URI path.
      This is the part of a web request that identifies a resource.
    query_string:
      Whether to enable redaction of the query string.
      This is the part of a URL that appears after a `?` character, if any.
    single_header:
      The list of names of the query headers to redact.
  DOC
  nullable    = false
}
