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

module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 9.0"

  name                = local.name
  engine              = var.engine
  engine_version      = var.engine_version
  engine_mode         = var.engine_mode
  instance_class      = var.instance_class
  instances           = var.instances
  database_name       = var.database_name
  deletion_protection = var.deletion_protection
  vpc_id              = var.vpc_id
  subnets             = var.subnets

  master_username             = var.master_username
  master_password             = var.master_password
  manage_master_user_password = var.manage_master_user_password
  security_group_rules        = var.security_group_rules
  publicly_accessible         = var.publicly_accessible
  storage_encrypted           = var.storage_encrypted
  storage_type                = var.storage_type
  apply_immediately           = var.apply_immediately
  skip_final_snapshot         = var.skip_final_snapshot
  monitoring_interval         = var.monitoring_interval
  db_subnet_group_name        = var.db_subnet_group_name
  create_db_subnet_group      = var.create_db_subnet_group
  ca_cert_identifier          = var.ca_cert_identifier

  backup_retention_period                = var.backup_retention_period
  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days
  snapshot_identifier                    = var.snapshot_identifier
  db_cluster_parameter_group_family      = var.db_cluster_parameter_group_family
  db_cluster_parameter_group_parameters  = var.db_cluster_parameter_group_parameters
  db_parameter_group_name                = var.db_parameter_group_name
  create_db_parameter_group              = var.create_db_parameter_group
  db_parameter_group_family              = var.db_parameter_group_family
  db_parameter_group_parameters          = var.db_parameter_group_parameters
  enabled_cloudwatch_logs_exports        = var.enabled_cloudwatch_logs_exports
  allocated_storage                      = var.allocated_storage
  performance_insights_enabled           = var.performance_insights_enabled
  serverlessv2_scaling_configuration     = var.serverlessv2_scaling_configuration

  cluster_tags = var.cluster_tags
  tags         = local.tags
}
