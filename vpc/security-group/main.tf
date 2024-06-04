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

module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name        = local.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  ingress_cidr_blocks      = var.ingress_cidr_blocks
  ingress_rules            = var.ingress_rules

  egress_with_cidr_blocks = var.egress_with_cidr_blocks
  egress_cidr_blocks      = var.egress_cidr_blocks
  egress_rules            = var.egress_rules

  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id
  egress_with_source_security_group_id  = var.egress_with_source_security_group_id

  tags = local.tags
}
