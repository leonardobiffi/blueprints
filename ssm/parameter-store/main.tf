provider "aws" {
  region = var.region
}

locals {
  name = "/${var.env}/${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "parameter" {
  source  = "terraform-aws-modules/ssm-parameter/aws"
  version = "~> 1.1"

  name   = local.name
  value  = var.value
  values = var.values

  description = var.description
  secure_type = var.secure_type

  tags = local.tags
}
