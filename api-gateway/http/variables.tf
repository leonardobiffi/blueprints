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
  description = "The name of the resource"
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

# Required
variable "domain_name" {
  description = "The domain name to use"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the certificate to use"
  type        = string
}

# Optional
variable "body" {
  description = "The OpenAPI specification to use"
  type        = string
  default     = null
}

variable "security_policy" {
  description = "The security policy to use"
  type        = string
  default     = "TLS_1_2"
}

variable "endpoint_type" {
  description = "The endpoint type to use"
  type        = string
  default     = "REGIONAL"
}

variable "mtls_enabled" {
  description = "Whether to enable mutual TLS authentication"
  type        = bool
  default     = false
}

variable "truststore_uri" {
  description = "The URI of the truststore to use"
  type        = string
  default     = null
}

variable "truststore_version" {
  description = "The version of the truststore to use"
  type        = string
  default     = null
}

variable "hosted_zone_id" {
  description = "The hosted zone ID to use"
  type        = string
  default     = null
}

variable "target_domain_name" {
  description = "The target domain name to use"
  type        = string
  default     = null
}

variable "authorizers" {
  description = "The authorizers to use"
  type = map(object({
    type                    = string
    identity_sources        = list(string)
    jwt_issuer              = optional(string, null)
    jwt_audience            = optional(list(string), [])
    uri                     = optional(string, null)
    payload_format_version  = optional(string, null)
    result_ttl_in_seconds   = optional(number, 0)
    enable_simple_responses = optional(bool, false)
  }))
  default = {}
}

variable "cors_configuration" {
  description = "The CORS configuration to use"
  type = object({
    allow_origins     = list(string)
    allow_methods     = list(string)
    allow_headers     = list(string)
    expose_headers    = list(string)
    allow_credentials = bool
    max_age           = number
  })
  default = null
}

variable "routes" {
  description = "The routes and integrations to use"
  type = map(object({
    integration_type       = string
    integration_uri        = string
    integration_method     = string
    connection_type        = string
    connection_id          = string
    authorizer             = optional(string, null)
    authorization_type     = optional(string, null)
    request_parameters     = optional(map(string), {})
    server_name_to_verify  = optional(string, null)
    payload_format_version = optional(string, "1.0")
    timeout_milliseconds   = optional(number, 30000)
    response_parameters = optional(list(object({
      status_code = number
      mappings    = map(string)
    })), [])
  }))
  default = {}
}

variable "access_log_settings" {
  description = "The access log settings to use"
  type = object({
    enabled        = bool
    format         = optional(string, null)
    retention_days = optional(number, 7)
  })
  default = null
}

variable "metrics_enabled" {
  description = "Whether to enable detailed metrics"
  type        = bool
  default     = false
}

variable "logging_level" {
  description = "The logging level to use"
  type        = string
  default     = "ERROR"
}

variable "throttling" {
  description = "The throttling burst limit and rate limit to use"
  type = object({
    rate_limit  = number
    burst_limit = number
  })
  default = {
    burst_limit = 5000
    rate_limit  = 10000
  }
}
