provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}/${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 2.2"

  repository_name   = local.name
  repository_type   = var.repository_type
  repository_policy = var.repository_policy

  repository_force_delete         = true
  repository_lifecycle_policy     = jsonencode(var.repository_lifecycle_policy)
  repository_image_tag_mutability = var.repository_image_tag_mutability

  tags = local.tags
}
