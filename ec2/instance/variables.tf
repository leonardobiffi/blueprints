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

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use"
  type        = string
}

variable "security_group_ids" {
  description = "The security group IDs to use"
  type        = list(string)
}

variable "subnet_id" {
  description = "The subnet ID to use"
  type        = string
}

variable "root_block_device" {
  description = "The root block device to use"
  type = object({
    volume_size = number
    volume_type = string
    throughput  = optional(number, null)
  })
}

# Optional
variable "ami" {
  description = "The AMI ID to use"
  type        = string
  default     = null
}

variable "ebs_block_device" {
  description = "The EBS block device to use"
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
    throughput  = optional(number, null)
    encrypted   = optional(bool, true)
  }))
  default = []
}

variable "user_data" {
  description = "The user data to use"
  type        = string
  default     = null
}

variable "monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = false
}

variable "ami_filters" {
  description = "The filters to use for search the AMI"
  type = list(object({
    name   = string
    values = list(string)
  }))
  default = []
}

variable "owners" {
  description = "The owners of the AMI"
  type        = list(string)
  default     = []
}

variable "create_iam_instance_profile" {
  description = "Create an IAM instance profile"
  type        = bool
  default     = false
}

variable "iam_role_policies" {
  description = "The IAM role policies to use"
  type        = map(string)
  default     = {}
}

variable "associate_elastic_ip" {
  description = "Associate an elastic IP"
  type        = bool
  default     = false
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address"
  type        = bool
  default     = false
}

variable "instance_tags" {
  description = "The tags to use for the instance"
  type        = map(string)
  default     = {}
}
