provider "aws" {
  region = "us-east-1"
}

locals {
  name        = "${var.env}-${var.name}"
  full_domain = var.subdomain != "" ? "${var.subdomain}.${var.domain_name}" : var.domain_name

  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 3.2"

  aliases = [local.full_domain]

  comment             = "CloudFront for ${local.name}"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = var.wait_for_deployment
  default_root_object = "index.html"

  create_origin_access_identity = var.create_origin_access_identity
  origin_access_identities      = var.origin_access_identities

  origin                 = var.origin
  default_cache_behavior = var.default_cache_behavior
  ordered_cache_behavior = var.ordered_cache_behavior
  custom_error_response  = var.custom_error_response

  viewer_certificate = {
    acm_certificate_arn      = var.acm_certificate_arn
    minimum_protocol_version = var.minimum_protocol_version
    ssl_support_method       = "sni-only"
  }

  tags = local.tags
}
