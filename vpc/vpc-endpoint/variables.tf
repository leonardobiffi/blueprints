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
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

# Optional
variable "subnet_ids" {
  description = "Subnets IDs to associate with the VPC endpoints"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "endpoints" {
  description = "Map of endpoint configurations"
  type = map(object({
    service             = string
    route_table_ids     = optional(list(string))
    private_dns_enabled = optional(bool)
    tags                = map(string)
  }))
  default = {}
}
