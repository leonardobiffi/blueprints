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
  description = "The type of the instance. If present then instance_requirements cannot be present."
  type        = string
}

# Optional
variable "image_id" {
  description = "The AMI from which to launch the instance."
  type        = string
  default     = null
}

variable "ecs_image_id" {
  description = "The AMI get from parameter store ecs recommended image"
  type        = bool
  default     = false
}

variable "use_mixed_instances_policy" {
  description = "The type of the instance. If present then instance_requirements cannot be present."
  type        = bool
  default     = false
}

variable "mixed_instances_policy" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups."
  type        = any
  default     = {}
}

variable "user_data" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups."
  type        = string
  default     = null
}

variable "security_groups" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups."
  type        = list(string)
  default     = []
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with availability_zones"
  type        = list(string)
  default     = null
}

variable "health_check_type" {
  description = "The service to use for the health checks"
  type        = string
  default     = null
}

variable "min_size" {
  description = "The minimum size of the autoscaling group"
  type        = number
  default     = null
}

variable "max_size" {
  description = "The maximum size of the autoscaling group"
  type        = number
  default     = null
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the autoscaling group"
  type        = number
  default     = null
}

variable "default_instance_warmup" {
  description = "Amount of time, in seconds, until a newly launched instance can contribute to the Amazon CloudWatch metrics. This delay lets an instance finish initializing before Amazon EC2 Auto Scaling aggregates instance metrics, resulting in more reliable usage data. Set this value equal to the amount of time that it takes for resource consumption to become stable after an instance reaches the InService state."
  type        = number
  default     = 300
}

variable "iam_role_policies" {
  description = "IAM role policies to attach to the role"
  type        = map(string)
  default     = {}
}

variable "autoscaling_group_tags" {
  description = "A list of tags to add to the autoscaling group"
  type        = map(string)
  default     = {}
}

variable "protect_from_scale_in" {
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for terminations."
  type        = bool
  default     = false
}

variable "schedules" {
  description = "Map of autoscaling group schedule to create"
  type        = map(any)
  default     = {}
}
