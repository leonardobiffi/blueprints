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

module "eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-eks-role"
  version = "~> 5.41"

  role_name                = local.name
  cluster_service_accounts = var.cluster_service_accounts

  role_policy_arns           = local.additional_policy ? merge({ default = module.policy[0].arn }, var.role_policy_arns) : var.role_policy_arns
  force_detach_policies      = var.force_detach_policies
  max_session_duration       = var.max_session_duration
  allow_self_assume_role     = var.allow_self_assume_role
  assume_role_condition_test = var.assume_role_condition_test

  tags = local.tags
}

# Policy
locals {
  additional_policy = length(var.policy_statements) > 0 || var.policy != null
}

module "policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.41"

  count = local.additional_policy ? 1 : 0

  name   = "${local.name}-default-policy"
  path   = "/"
  policy = var.policy != null ? jsonencode(var.policy) : data.aws_iam_policy_document.policy.json

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
