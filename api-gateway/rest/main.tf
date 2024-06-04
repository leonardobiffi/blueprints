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

resource "aws_api_gateway_domain_name" "main" {
  domain_name              = var.domain_name
  regional_certificate_arn = var.certificate_arn
  security_policy          = var.security_policy

  endpoint_configuration {
    types = var.endpoint_types
  }

  dynamic "mutual_tls_authentication" {
    for_each = var.mtls_enabled ? [1] : []
    content {
      truststore_uri     = var.truststore_uri
      truststore_version = var.truststore_version
    }
  }

  tags = local.tags
}

resource "aws_api_gateway_rest_api" "main" {
  name = local.name
  body = var.body

  disable_execute_api_endpoint = true

  endpoint_configuration {
    types = var.endpoint_types
  }

  tags = local.tags
}

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.main.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "main" {
  deployment_id = aws_api_gateway_deployment.main.id
  rest_api_id   = aws_api_gateway_rest_api.main.id
  stage_name    = var.env
}
