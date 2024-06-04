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

# Policy
data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      sid         = statement.value.sid
      effect      = statement.value.effect
      actions     = statement.value.actions
      not_actions = statement.value.not_actions
      resources   = statement.value.resources

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

module "policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.33"

  name   = local.name
  path   = var.path
  policy = data.aws_iam_policy_document.policy.json

  tags = local.tags
}
