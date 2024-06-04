provider "aws" {
  region = var.region
}

locals {
  name = "/${var.env}/${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "secrets" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "~> 1.1"

  name          = local.name
  description   = var.description
  secret_string = var.secret_string

  # Policy
  create_policy       = var.create_policy
  block_public_policy = var.block_public_policy
  policy_statements   = var.policy_statements

  recovery_window_in_days = 7
  ignore_secret_changes   = var.ignore_secret_changes
  enable_rotation         = false

  tags = local.tags
}
