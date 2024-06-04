provider "aws" {
  region = var.region
}

locals {
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.33"

  for_each = var.users

  name          = each.key
  force_destroy = true

  create_iam_access_key         = each.value.create_iam_access_key
  create_iam_user_login_profile = each.value.create_iam_user_login_profile
  password_reset_required       = true
  password_length               = 16

  policy_arns = each.value.policy_arns

  tags = local.tags
}

# Attach users to groups
resource "aws_iam_user_group_membership" "this" {
  for_each = var.users

  user   = each.key
  groups = each.value.groups

  depends_on = [module.iam_user]
}
