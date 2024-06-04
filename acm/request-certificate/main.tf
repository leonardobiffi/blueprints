provider "aws" {
  region = var.region
}

locals {
  tags = merge(var.tags, var.system_tags, {
    Name        = var.domain_name
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 5.0"

  domain_name = var.domain_name
  zone_id     = var.zone_id

  subject_alternative_names = flatten(var.subject_alternative_names)
  wait_for_validation       = var.wait_for_validation
  validation_method         = "DNS"
  create_route53_records    = var.create_route53_records
  validate_certificate      = var.validate_certificate

  tags = local.tags
}
