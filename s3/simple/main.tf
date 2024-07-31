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

locals {
  attach_policy = length(var.policy) > 0 ? true : false
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.1"

  bucket         = local.name
  force_destroy  = var.force_destroy
  lifecycle_rule = var.lifecycle_rule

  attach_policy = local.attach_policy
  policy        = local.attach_policy ? data.aws_iam_policy_document.main[0].json : null
  cors_rule     = var.cors_rule
  versioning    = var.versioning
  website       = var.website

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  server_side_encryption_configuration = var.server_side_encryption_configuration
  control_object_ownership             = var.control_object_ownership
  object_ownership                     = var.object_ownership

  tags = local.tags
}

data "aws_iam_policy_document" "main" {
  count = local.attach_policy ? 1 : 0

  dynamic "statement" {
    for_each = var.policy
    content {
      sid       = statement.value.sid
      effect    = statement.value.effect
      actions   = statement.value.actions
      resources = statement.value.resources
      principals {
        type        = "AWS"
        identifiers = ["*"]
      }
    }
  }
}
