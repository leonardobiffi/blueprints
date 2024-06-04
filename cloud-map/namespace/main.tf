provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })

  private_namespace = var.namespace_type == "PRIVATE"
}

resource "aws_service_discovery_private_dns_namespace" "main" {
  count = local.private_namespace ? 1 : 0

  name        = var.name
  description = var.description
  vpc         = var.vpc_id

  tags = local.tags
}

resource "aws_service_discovery_public_dns_namespace" "main" {
  count = local.private_namespace ? 0 : 1

  name        = var.name
  description = var.description

  tags = local.tags
}
