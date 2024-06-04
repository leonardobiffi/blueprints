provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "~> 1.6"

  # File system
  name      = local.name
  encrypted = true

  lifecycle_policy = var.lifecycle_policy

  # File system policy
  attach_policy     = true
  policy_statements = var.policy_statements

  # Mount targets / security group
  mount_targets = var.mount_targets

  security_group_description = "EFS security group for ${local.name}"
  security_group_vpc_id      = var.vpc_id
  security_group_rules       = var.security_group_rules

  # Access point(s)
  access_points = var.access_points

  tags = local.tags
}
