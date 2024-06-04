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

resource "aws_wafv2_ip_set" "main" {
  name = local.name

  description        = var.description
  scope              = var.scope
  ip_address_version = var.ip_address_version
  addresses          = var.addresses

  tags = local.tags
}
