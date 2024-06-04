provider "aws" {
  region = var.region
}

provider "awsutils" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "ses" {
  source  = "cloudposse/ses/aws"
  version = "~> 0.25"

  name          = var.name
  domain        = var.domain
  zone_id       = var.zone_id
  verify_dkim   = var.verify_dkim
  verify_domain = var.verify_domain

  ses_user_enabled  = var.ses_user_enabled
  ses_group_enabled = false

  tags = local.tags
}
