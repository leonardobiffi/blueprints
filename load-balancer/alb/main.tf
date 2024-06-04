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

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.4"

  name               = local.name
  load_balancer_type = "application"
  internal           = var.internal
  
  enable_deletion_protection = var.enable_deletion_protection

  vpc_id  = var.vpc_id
  subnets = var.subnets

  # Security Group
  security_group_ingress_rules = var.security_group_ingress_rules

  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  security_group_tags = {
    Name = "${local.name}-alb"
  }

  target_groups = var.target_groups
  listeners     = var.listeners

  tags = local.tags
}
