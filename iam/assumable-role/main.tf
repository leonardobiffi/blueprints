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

module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.33"

  role_name           = local.name
  role_description    = "Assumable role for ${local.name}"
  role_requires_mfa   = var.role_requires_mfa
  role_path           = var.role_path
  attach_admin_policy = var.attach_admin_policy

  # https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/
  allow_self_assume_role = var.allow_self_assume_role

  trusted_role_arns       = var.trusted_role_arns
  trusted_role_services   = var.trusted_role_services
  max_session_duration    = var.max_session_duration
  create_role             = true
  create_instance_profile = var.create_instance_profile
  custom_role_policy_arns = length(var.policy_statements) > 0 ? concat([module.policy[0].arn], var.custom_role_policy_arns) : var.custom_role_policy_arns

  tags = local.tags
}

# Policy
module "policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.33"

  count = length(var.policy_statements) > 0 ? 1 : 0

  name   = "${local.name}-default-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.policy.json

  tags = local.tags
}

data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      sid       = statement.value.sid
      effect    = statement.value.effect
      actions   = statement.value.actions
      resources = statement.value.resources

      dynamic "condition" {
        for_each = statement.value.conditions == null ? [] : statement.value.conditions
        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}
