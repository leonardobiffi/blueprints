provider "aws" {
  region = var.region
}

locals {
  name     = "${var.env}-${var.name}"
  ecr_name = try("${var.env}/${var.ecr_name}", "")
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })

  image     = var.create_ecr ? module.ecr.repository_url : var.image
  image_url = var.image_tag != null ? "${local.image}:${var.image_tag}" : local.image
}

module "ecs_service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 5.11"

  name        = local.name
  cluster_arn = var.cluster_arn

  cpu    = var.cpu
  memory = var.memory

  desired_count                     = var.desired_count
  enable_autoscaling                = var.enable_autoscaling
  autoscaling_min_capacity          = var.autoscaling_min_capacity
  autoscaling_max_capacity          = var.autoscaling_max_capacity
  health_check_grace_period_seconds = var.health_check_grace_period_seconds
  capacity_provider_strategy        = var.capacity_provider_strategy
  propagate_tags                    = var.propagate_tags
  platform_version                  = var.platform_version
  launch_type                       = var.launch_type
  network_mode                      = var.network_mode
  volume                            = var.volume
  security_group_ids                = var.security_group_ids
  scheduling_strategy               = var.scheduling_strategy
  deployment_circuit_breaker        = var.deployment_circuit_breaker
  service_registries                = var.service_registries
  requires_compatibilities          = var.launch_type == "EC2" ? ["EC2"] : var.requires_compatibilities

  # Enables ECS Exec
  enable_execute_command = true

  # Container definition(s)
  container_definitions = {
    (local.name) = {
      image              = local.image_url
      cpu                = var.launch_type != "EC2" ? var.cpu : null
      memory             = var.launch_type != "EC2" ? var.memory : null
      memory_reservation = var.memory_reservation
      essential          = true
      secrets            = var.secrets
      environment        = var.environment
      mount_points       = var.mount_points
      health_check       = var.health_check
      command            = var.command

      port_mappings = var.container_port != null ? [
        {
          name          = local.name
          containerPort = var.container_port
          hostPort      = var.target_port
          protocol      = "tcp"
        }
      ] : null

      # Example image used requires access to write to root filesystem
      readonly_root_filesystem = false

      # Use cloudwatch logging
      enable_cloudwatch_logging = true
    }
  }

  # Add a load balancer to the service
  load_balancer = var.target_group_arn != null ? {
    service = {
      target_group_arn = var.target_group_arn
      container_name   = local.name
      container_port   = var.container_port
    }
  } : {}

  subnet_ids           = var.subnet_ids
  security_group_rules = var.security_group_rules

  create_iam_role            = var.create_iam_role
  create_tasks_iam_role      = var.create_tasks_iam_role
  tasks_iam_role_name        = "${local.name}-tasks"
  tasks_iam_role_description = "IAM role for tasks ${local.name}"
  tasks_iam_role_policies    = var.tasks_iam_role_policies
  tasks_iam_role_statements  = var.tasks_iam_role_statements

  service_tags = var.service_tags
  tags         = local.tags
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 2.2"

  create_repository               = var.create_ecr
  repository_name                 = local.ecr_name
  repository_image_tag_mutability = "MUTABLE"
  repository_type                 = "private"
  repository_force_delete         = true

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "remove untagged images"
        action = {
          type = "expire"
        }
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 1
        }
      },
      {
        rulePriority = 2
        description  = "keep last 10 images"
        action = {
          type = "expire"
        }
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
      },
    ]
  })

  tags = local.tags
}
