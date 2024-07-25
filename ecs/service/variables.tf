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

variable "cluster_arn" {
  description = "The ARN of the cluster"
  type        = string
}

# Optional
variable "cpu" {
  description = "The number of cpu units to reserve for the container. Required if FARAGATE launch type is used"
  type        = number
  default     = null
}

variable "memory" {
  description = "The amount of memory to reserve for the container. Required if FARAGATE launch type is used"
  type        = number
  default     = null
}

variable "subnet_ids" {
  description = "The subnet IDs to use"
  type        = list(string)
  default     = []
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = number
  default     = 1
}

variable "enable_autoscaling" {
  description = "Determines whether to enable autoscaling for the service"
  type        = bool
  default     = true
}

variable "autoscaling_min_capacity" {
  description = "The minimum number of instances of the task definition to place and keep running"
  type        = number
  default     = 1
}

variable "autoscaling_max_capacity" {
  description = "The maximum number of instances of the task definition to place and keep running"
  type        = number
  default     = 1
}

variable "security_group_rules" {
  description = "Security group rules to add to the security group created"
  type        = any
  default     = {}
}

variable "container_port" {
  description = "The port to use for the container"
  type        = number
  default     = null
}

variable "target_port" {
  description = "The port to use for the target group"
  type        = number
  default     = null
}

variable "target_group_arn" {
  description = "The ARN of the target group to use"
  type        = string
  default     = null
}

variable "create_ecr" {
  description = "Whether to create an ECR repository"
  type        = bool
  default     = true
}

variable "ecr_name" {
  description = "The name of the ECR repository to use"
  type        = string
  default     = null
}

variable "memory_reservation" {
  description = "The amount of memory to reserve for the container"
  type        = number
  default     = null
}

variable "image" {
  description = "The image to use for the container"
  type        = string
  default     = null
}

variable "image_tag" {
  description = "The image tag to use for the container"
  type        = string
  default     = null
}

variable "command" {
  description = "The command that is passed to the container"
  type        = list(string)
  default     = []
}

variable "secrets" {
  description = "The secrets to pass to the container. For more information, see [Specifying Sensitive Data](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html) in the Amazon Elastic Container Service Developer Guide"
  type = list(object({
    name      = string
    valueFrom = string
  }))
  default = []
}

variable "environment" {
  description = "The environment variables to pass to the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "health_check" {
  description = "The container health check command and associated configuration parameters for the container. See [HealthCheck](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html)"
  type        = any
  default     = {}
}

variable "tasks_iam_role_policies" {
  description = "Map of IAM role policy ARNs to attach to the IAM role"
  type        = map(string)
  default     = {}
}

variable "tasks_iam_role_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = {}
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers"
  type        = number
  default     = null
}

variable "capacity_provider_strategy" {
  description = "Capacity provider strategies to use for the service. Can be one or more"
  type        = any
  default     = {}
}

variable "propagate_tags" {
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are `SERVICE` and `TASK_DEFINITION`"
  type        = string
  default     = "TASK_DEFINITION"
}

variable "platform_version" {
  description = "Platform version on which to run your service. Only applicable for `launch_type` set to `FARGATE`. Defaults to `LATEST`"
  type        = string
  default     = "LATEST"
}

variable "launch_type" {
  description = "The launch type to use for the service (\"EC2\" or \"FARGATE\")."
  type        = string
  default     = null
}

variable "requires_compatibilities" {
  description = "Set of launch types required by the task. The valid values are `EC2` and `FARGATE`"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "service_tags" {
  description = "Tags to add to the service only"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "List of security groups to associate with the task or service"
  type        = list(string)
  default     = []
}

variable "scheduling_strategy" {
  description = "Scheduling strategy to use for the service. The valid values are `REPLICA` and `DAEMON`. Defaults to `REPLICA`"
  type        = string
  default     = null
}

variable "deployment_circuit_breaker" {
  description = "Configuration block for deployment circuit breaker"
  type        = any
  default = {
    enable   = true
    rollback = true
  }
}

variable "service_registries" {
  description = "Service discovery registries for the service"
  type        = any
  default     = {}
}

variable "network_mode" {
  description = "The network mode to use for the task. The valid values are `none`, `bridge`, `awsvpc`, and `host`"
  type        = string
  default     = "awsvpc"
}

variable "volume" {
  description = "Configuration block for volumes that containers in your task may use"
  type        = any
  default     = {}
}

variable "mount_points" {
  description = "The mount points for data volumes in your container"
  type        = list(any)
  default     = []
}

variable "create_tasks_iam_role" {
  description = "Whether to create an IAM role for the tasks"
  type        = bool
  default     = true
}

variable "create_iam_role" {
  description = "Whether to create an IAM role for the service"
  type        = bool
  default     = true
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI (Fargate launch type only)"
  type        = bool
  default     = false
}
