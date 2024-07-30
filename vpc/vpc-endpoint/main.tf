locals {
  tags = {
    ManagedBy   = "Terraform"
  }
}

module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "5.9.0"

  vpc_id                = var.vpc_id
  subnet_ids            = var.subnet_ids
  security_group_ids    = var.security_group_ids
  endpoints             = var.endpoints
  tags                  = local.tags
}
