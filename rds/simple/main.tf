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

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.6"

  identifier = local.name

  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  iops                  = var.iops
  db_name               = var.db_name
  username              = var.username
  port                  = var.port

  manage_master_user_password = true
  vpc_security_group_ids      = [module.security_group.security_group_id]
  maintenance_window          = var.maintenance_window
  backup_window               = var.backup_window
  backup_retention_period     = var.backup_retention_period
  ca_cert_identifier          = var.ca_cert_identifier

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.subnet_ids

  # DB parameter group
  family               = var.family == null ? format("%s%s", var.engine, var.engine_version) : var.family
  major_engine_version = var.major_engine_version == null ? var.engine_version : var.major_engine_version
  parameters           = var.parameters

  deletion_protection   = var.deletion_protection
  apply_immediately     = var.apply_immediately
  skip_final_snapshot   = var.skip_final_snapshot
  copy_tags_to_snapshot = true

  create_db_option_group = false
  option_group_name      = var.option_group_name

  tags = merge(local.tags, var.schedule_tag)
}
