provider "aws" {
  region = var.region
}

locals {
  name = format("%s-%s", var.env, var.name)
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.4"

  name               = local.name
  load_balancer_type = "network"
  internal           = var.internal
  vpc_id             = var.vpc_id
  subnets            = var.subnets
  subnet_mapping     = var.attach_ip ? [for i, eip in aws_eip.this : { allocation_id : eip.id, subnet_id : var.subnets[i] }] : []

  listeners                    = var.listeners
  target_groups                = var.target_groups
  security_group_ingress_rules = var.security_group_ingress_rules

  tags = local.tags
}

resource "aws_eip" "this" {
  count = var.attach_ip ? length(var.subnets) : 0

  domain = "vpc"
  tags   = local.tags
}
