provider "aws" {
  region = "us-east-1"
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Name        = local.name
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

resource "aws_cloudfront_origin_request_policy" "main" {
  name    = local.name
  comment = var.comment

  cookies_config {
    cookie_behavior = var.cookies_config.cookie_behavior
    cookies {
      items = var.cookies_config.items
    }
  }
  headers_config {
    header_behavior = var.headers_config.header_behavior
    headers {
      items = var.headers_config.items
    }
  }
  query_strings_config {
    query_string_behavior = var.query_strings_config.query_string_behavior
    query_strings {
      items = var.query_strings_config.items
    }
  }
}
