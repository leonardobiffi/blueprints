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

variable "body" {
  description = "The OpenAPI specification to use"
  type        = string
}

# Optional
variable "security_policy" {
  description = "The security policy to use"
  type        = string
  default     = "TLS_1_2"
}

variable "endpoint_types" {
  description = "The endpoint types to use"
  type        = list(string)
  default     = ["REGIONAL"]
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
