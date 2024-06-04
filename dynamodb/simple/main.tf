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

module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "~> 4.0"

  name         = local.name
  hash_key     = var.hash_key
  range_key    = var.range_key
  attributes   = var.attributes
  table_class  = var.table_class
  billing_mode = var.billing_mode

  write_capacity                 = var.write_capacity
  read_capacity                  = var.read_capacity
  point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
  ttl_enabled                    = var.ttl_enabled
  ttl_attribute_name             = var.ttl_attribute_name
  global_secondary_indexes       = var.global_secondary_indexes
  local_secondary_indexes        = var.local_secondary_indexes
  replica_regions                = var.replica_regions
  stream_enabled                 = var.stream_enabled
  stream_view_type               = var.stream_view_type
  autoscaling_enabled            = var.autoscaling_enabled
  autoscaling_defaults           = var.autoscaling_defaults
  autoscaling_read               = var.autoscaling_read
  autoscaling_write              = var.autoscaling_write
  autoscaling_indexes            = var.autoscaling_indexes

  deletion_protection_enabled           = var.deletion_protection_enabled
  server_side_encryption_enabled        = var.server_side_encryption_enabled
  server_side_encryption_kms_key_arn    = var.server_side_encryption_kms_key_arn
  ignore_changes_global_secondary_index = var.ignore_changes_global_secondary_index

  tags = local.tags
}
