provider "aws" {
  region = var.scope == "REGIONAL" ? var.region : "us-east-1"
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "waf" {
  source  = "umotif-public/waf-webaclv2/aws"
  version = "~> 5.1"

  name_prefix = local.name
  alb_arn     = var.alb_arn
  description = var.description
  scope       = var.scope
  rules       = var.rules

  create_alb_association = var.alb_arn != null ? true : false
  allow_default_action   = var.allow_default_action

  visibility_config = {
    metric_name                = "${local.name}-webacl-metric-name"
    cloudwatch_metrics_enabled = true
    sampled_requests_enabled   = true
  }

  tags = local.tags
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "main" {
  count = var.create_logging_configuration ? 1 : 0

  name              = "aws-waf-logs-${local.name}"
  retention_in_days = var.cloudwatch_log_retention_days

  tags = local.tags
}

resource "aws_wafv2_web_acl_logging_configuration" "main" {
  count = var.create_logging_configuration ? 1 : 0

  log_destination_configs = [aws_cloudwatch_log_group.main[0].arn]
  resource_arn            = module.waf.web_acl_arn

  dynamic "redacted_fields" {
    for_each = var.redacted_fields

    content {
      dynamic "method" {
        for_each = redacted_fields.value.method ? [true] : []
        content {}
      }

      dynamic "query_string" {
        for_each = redacted_fields.value.query_string ? [true] : []
        content {}
      }

      dynamic "uri_path" {
        for_each = redacted_fields.value.uri_path ? [true] : []
        content {}
      }

      dynamic "single_header" {
        for_each = lookup(redacted_fields.value, "single_header", null) != null ? toset(redacted_fields.value.single_header) : []
        content {
          name = single_header.value
        }
      }
    }
  }

  depends_on = [
    aws_cloudwatch_log_group.main,
    module.waf,
  ]
}
