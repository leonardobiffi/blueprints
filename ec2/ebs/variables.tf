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

variable "instance_id" {
  description = "The type of instance to use"
  type        = string
}

variable "size" {
  description = "The size of the volume"
  type        = number
}

variable "availability_zone" {
  description = "The availability zone to use"
  type        = string
}

variable "device_name" {
  description = "The device name to use"
  type        = string
}

# Optional
variable "encrypted" {
  description = "Whether the volume should be encrypted"
  type        = bool
  default     = true
}

variable "iops" {
  description = "The IOPS of the volume"
  type        = number
  default     = null
}

variable "throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3"
  type        = number
  default     = null
}

variable "type" {
  description = "The type of the volume"
  type        = string
  default     = "gp3"
}

variable "kms_key_id" {
  description = "The KMS key ID to use"
  type        = string
  default     = null
}
