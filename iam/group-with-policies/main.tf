provider "aws" {
  region = var.region
}

locals {
  name = var.fullname != null ? var.fullname : "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "iam_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 5.33"

  name = local.name
  path = var.path

  custom_group_policy_arns          = var.custom_group_policy_arns
  attach_iam_self_management_policy = var.attach_iam_self_management_policy
  enable_mfa_enforcement            = var.enable_mfa_enforcement

  tags = local.tags
}
