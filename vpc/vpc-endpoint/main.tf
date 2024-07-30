module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id                = var.vpc_id
  subnet_ids            = var.subnet_ids
  security_group_ids    = var.security_group_ids
  endpoints             = var.endpoints
  tags                  = var.tags
}
