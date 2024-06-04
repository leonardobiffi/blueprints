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
  description = "The name of the resource to create"
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
variable "namespace_id" {
  description = "The ID of the namespace"
  type        = string
}

# Optional
variable "dns_ttl" {
  description = "The TTL of the DNS record"
  type        = number
  default     = 60
}

variable "dns_record_type" {
  description = "The type of the DNS record"
  type        = string
  default     = "A"
}

variable "routing_policy" {
  description = "The routing policy of the service"
  type        = string
  default     = "MULTIVALUE"
}

variable "failure_threshold" {
  description = "The number of consecutive health checks that an endpoint must pass or fail"
  type        = number
  default     = 3
}
