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

resource "aws_apigatewayv2_domain_name" "main" {
  domain_name = var.domain_name

  domain_name_configuration {
    endpoint_type   = var.endpoint_type
    certificate_arn = var.certificate_arn
    security_policy = var.security_policy
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

resource "aws_apigatewayv2_api" "main" {
  name          = local.name
  body          = var.body
  protocol_type = "HTTP"

  dynamic "cors_configuration" {
    for_each = var.cors_configuration != null ? [1] : []
    content {
      allow_origins     = var.cors_configuration.allow_origins
      allow_methods     = var.cors_configuration.allow_methods
      allow_headers     = var.cors_configuration.allow_headers
      expose_headers    = var.cors_configuration.expose_headers
      allow_credentials = var.cors_configuration.allow_credentials
      max_age           = var.cors_configuration.max_age
    }
  }

  disable_execute_api_endpoint = true

  tags = local.tags
}

resource "aws_apigatewayv2_stage" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = var.env
  auto_deploy = true

  default_route_settings {
    detailed_metrics_enabled = var.metrics_enabled
    logging_level            = var.logging_level
    throttling_burst_limit   = var.throttling.burst_limit
    throttling_rate_limit    = var.throttling.rate_limit
  }

  dynamic "access_log_settings" {
    for_each = var.access_log_settings.enabled ? [1] : []
    content {
      destination_arn = aws_cloudwatch_log_group.main[0].arn
      format = var.access_log_settings.format != null ? var.access_log_settings.format : jsonencode(
        {
          httpMethod      = "$context.httpMethod"
          ip              = "$context.identity.sourceIp"
          protocol        = "$context.protocol"
          requestId       = "$context.requestId"
          requestTime     = "$context.requestTime"
          responseLength  = "$context.responseLength"
          routeKey        = "$context.routeKey"
          status          = "$context.status"
          authorizerError = "$context.authorizer.error"
        }
      )
    }
  }

  tags = local.tags
}

resource "aws_apigatewayv2_api_mapping" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  domain_name = aws_apigatewayv2_domain_name.main.id
  stage       = aws_apigatewayv2_stage.main.id
}

resource "aws_apigatewayv2_authorizer" "main" {
  for_each = var.authorizers

  api_id           = aws_apigatewayv2_api.main.id
  name             = each.key
  authorizer_type  = each.value.type
  identity_sources = each.value.identity_sources

  # Required for HTTP API Lambda authorizers
  authorizer_uri                    = each.value.uri
  authorizer_payload_format_version = each.value.payload_format_version
  authorizer_result_ttl_in_seconds  = each.value.result_ttl_in_seconds
  enable_simple_responses           = each.value.enable_simple_responses

  dynamic "jwt_configuration" {
    for_each = each.value.jwt_issuer != null ? [1] : []
    content {
      issuer   = each.value.jwt_issuer
      audience = each.value.jwt_audience
    }
  }
}

resource "aws_apigatewayv2_integration" "main" {
  for_each = var.routes

  api_id             = aws_apigatewayv2_api.main.id
  integration_type   = each.value.integration_type
  integration_method = each.value.integration_method
  integration_uri    = each.value.integration_uri

  connection_type = each.value.connection_type
  connection_id   = each.value.connection_id

  request_parameters     = each.value.request_parameters
  payload_format_version = each.value.payload_format_version
  timeout_milliseconds   = each.value.timeout_milliseconds

  dynamic "tls_config" {
    for_each = each.value.server_name_to_verify != null ? [1] : []
    content {
      server_name_to_verify = each.value.server_name_to_verify
    }
  }

  dynamic "response_parameters" {
    for_each = { for k, v in each.value.response_parameters : k => v }
    content {
      status_code = each.value.response_parameters.status_code
      mappings    = each.value.response_parameters.mappings
    }
  }
}

resource "aws_apigatewayv2_route" "main" {
  for_each = var.routes

  api_id    = aws_apigatewayv2_api.main.id
  route_key = each.key
  target    = try("integrations/${aws_apigatewayv2_integration.main[each.key].id}", null)

  authorization_type = each.value.authorization_type
  authorizer_id      = try(aws_apigatewayv2_authorizer.main[each.value.authorizer].id, null)
}

# Create cloudwatch logs if access log settings are enabled
resource "aws_cloudwatch_log_group" "main" {
  count = var.access_log_settings.enabled ? 1 : 0

  name              = "/aws/apigateway/${local.name}"
  retention_in_days = var.access_log_settings.retention_days

  tags = local.tags
}
