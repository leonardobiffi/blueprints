provider "aws" {
  region = var.region
}

locals {
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

resource "aws_service_discovery_service" "main" {
  name = var.name

  dns_config {
    namespace_id = var.namespace_id

    dns_records {
      ttl  = var.dns_ttl
      type = var.dns_record_type
    }

    routing_policy = var.routing_policy
  }

  health_check_custom_config {
    failure_threshold = var.failure_threshold
  }

  tags = local.tags
}
