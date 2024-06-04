provider "aws" {
  region = var.region
}

locals {
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.11"

  zones = {
    for zone in var.zones : zone.name => {
      comment = zone.comment
      tags    = zone.tags
    }
  }

  tags = local.tags
}
