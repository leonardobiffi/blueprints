variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

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
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}