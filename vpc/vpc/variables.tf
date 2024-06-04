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

# Required
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "The availability zones to use"
  type        = list(string)
}

variable "public_subnets" {
  description = "The public subnets to use"
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
}

variable "database_subnets" {
  description = "The database subnets to use"
  type        = list(string)
}

# Optional
variable "enable_nat_gateway" {
  description = "Boolean determining if NAT gateways should be created"
  type        = bool
  default     = true
}
