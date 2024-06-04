### Default variables for blueprints ###

# Required
variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "name" {
  description = "The name of the resource"
  type        = string
}

# Optional
variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}

variable "system_tags" {
  description = "System tags to use. Automatically populated by the terragrunt."
  type        = map(string)
  default     = {}
}

### Variables for this blueprint ###

# Required
variable "vpc_id" {
  description = "VPC ID to create the cluster in (e.g. `vpc-a22222ee`)"
  type        = string
}

variable "subnet_ids" {
  description = "List of VPC subnet IDs to place DocumentDB instances in"
  type        = list(string)
}

# https://docs.aws.amazon.com/documentdb/latest/developerguide/limits.html#suported-instance-types
variable "instance_class" {
  description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
  type        = string
}

variable "cluster_size" {
  description = "Number of DB instances to create in the cluster"
  type        = number
}

variable "master_username" {
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
  type        = string
}

variable "master_password" {
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocumentDB Naming Constraints"
  type        = string
}

# Optional
variable "allowed_security_groups" {
  description = "List of existing Security Groups to be allowed to connect to the DocumentDB cluster"
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks to be allowed to connect to the DocumentDB cluster"
  type        = list(string)
  default     = []
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
  type        = string
  default     = ""
}

variable "db_port" {
  description = "DocumentDB port"
  type        = number
  default     = 27017
}

variable "retention_period" {
  description = "Number of days to retain backups for"
  type        = number
  default     = 5
}

variable "preferred_backup_window" {
  description = "Daily time range during which the backups happen"
  type        = string
  default     = "07:00-09:00"
}

variable "preferred_maintenance_window" {
  description = "The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`."
  type        = string
  default     = "Mon:22:00-Mon:23:00"
}

variable "cluster_parameters" {
  description = "List of DB parameters to apply"
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default = []
}

variable "cluster_family" {
  description = "The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html"
  type        = string
  default     = "docdb4.0"
}

variable "engine" {
  description = "The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb`"
  type        = string
  default     = "docdb"
}

variable "engine_version" {
  description = "The version number of the database engine to use"
  type        = string
  default     = "4.0.0"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  type        = string
  default     = ""
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "A value that indicates whether the DB cluster has deletion protection enabled"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Specifies whether any minor engine upgrades will be applied automatically to the DB instance during the maintenance window or not"
  type        = bool
  default     = true
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to cloudwatch. The following log types are supported: `audit`, `error`, `general`, `slowquery`"
  type        = list(string)
  default     = []
}
