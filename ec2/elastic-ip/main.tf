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

resource "aws_eip" "main" {
  instance = var.instance_id
  domain   = var.domain

  tags = merge(local.tags, {
    Name = local.name
  })
}
