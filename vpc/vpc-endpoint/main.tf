provider "aws" {
  region = var.region
}

locals {
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "~> 5.5"

  vpc_id                = var.vpc_id
  subnet_ids            = var.subnet_ids
  security_group_ids    = var.security_group_ids
  endpoints             = var.endpoints
  tags                  = local.tags
}
