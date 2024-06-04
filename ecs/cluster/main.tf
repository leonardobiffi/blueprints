provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "~> 5.11"

  cluster_name                = local.name
  create_cloudwatch_log_group = var.create_cloudwatch_log_group

  cluster_settings = {
    "name" : "containerInsights",
    "value" : var.container_insights
  }

  # Capacity providers
  default_capacity_provider_use_fargate = var.default_capacity_provider == "FARGATE" ? true : false
  fargate_capacity_providers            = var.fargate_capacity_providers
  autoscaling_capacity_providers        = var.autoscaling_capacity_providers

  tags = local.tags
}
