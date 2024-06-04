module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name        = "${local.name}-rds"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks              = var.ingress_with_cidr_blocks
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id
  ingress_rules                         = var.ingress_rules
  egress_rules                          = var.egress_rules

  tags = local.tags
}
