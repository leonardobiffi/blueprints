provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 7.4"

  function_name = local.name
  description   = var.description
  handler       = var.handler
  runtime       = var.runtime

  publish               = true
  source_path           = var.source_path
  environment_variables = var.environment_variables
  allowed_triggers      = var.allowed_triggers

  cloudwatch_logs_skip_destroy      = false
  cloudwatch_logs_retention_in_days = var.cloudwatch_logs_retention_in_days

  tags = local.tags
}
