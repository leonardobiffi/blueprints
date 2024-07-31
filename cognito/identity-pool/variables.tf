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
variable "cognito_identity_providers" {
  description = "The list of Cognito Identity Providers"
  type = list(object({
    client_id               = string
    provider_name           = string
    server_side_token_check = bool
  }))
  default = []
}

variable "allow_unauthenticated_identities" {
  description = "Whether to allow unauthenticated identities"
  type        = bool
  default     = false
}

variable "allow_classic_flow" {
  description = "Whether to allow classic flow"
  type        = bool
  default     = false
}

variable "supported_login_providers" {
  description = "The list of supported login providers"
  type        = map(string)
  default     = {}
}

variable "roles" {
  description = "The roles to use"
  type = object({
    authenticated   = optional(bool, false)
    unauthenticated = optional(bool, false)
  })
  default = {}
}

variable "role_mapping" {
  description = "The list of role mapping to use"
  type = list(object({
    ambiguous_role_resolution = string
    identity_provider         = string
    type                      = string
  }))
  default = []
}

variable "saml_provider_arns" {
  description = "The list of SAML provider ARNs"
  type        = list(string)
  default     = []
}

variable "openid_connect_provider_arns" {
  description = "The list of OpenID Connect provider ARNs"
  type        = list(string)
  default     = []
}

variable "user_pool_arns" {
  description = "The list of user pool ARNs"
  type        = list(string)
  default     = []
}
