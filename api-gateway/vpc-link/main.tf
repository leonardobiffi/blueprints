provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Name        = local.name
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

resource "aws_api_gateway_vpc_link" "main" {
  count = var.api_gateway_version == "v1" ? 1 : 0

  name        = local.name
  description = "VPC Link for ${local.name}"
  target_arns = var.target_arn != null ? [var.target_arn] : []

  tags = local.tags
}

resource "aws_apigatewayv2_vpc_link" "main" {
  count = var.api_gateway_version == "v2" ? 1 : 0

  name               = local.name
  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = local.tags
}
