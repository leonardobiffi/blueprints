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
  description = "The name to use of resources"
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

variable "schedule_tag" {
  description = "The tag to use to schedule start and stop of the service"
  type        = map(string)
  default     = {}
}

### Variables for this blueprint ###

# Required
variable "engine_version" {
  description = "The RDS engine version to use"
  type        = string
}

variable "allocated_storage" {
  description = "The RDS allocated storage to use"
  type        = number
}

variable "max_allocated_storage" {
  description = "The RDS max allocated storage to use"
  type        = number
}

variable "db_name" {
  description = "The RDS database name to use"
  type        = string
}

variable "username" {
  description = "The RDS username to use"
  type        = string
}


variable "subnet_ids" {
  description = "The RDS subnet IDs to use"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID to use"
  type        = string
}

# Optional
variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "major_engine_version" {
  description = "The RDS parameter group major engine version to use"
  type        = string
  default     = null
}

variable "family" {
  description = "The RDS parameter group family to use"
  type        = string
  default     = null
}

variable "engine" {
  description = "The RDS engine to use"
  type        = string
  default     = "mysql"
}

variable "instance_class" {
  description = "The RDS instance class to use"
  type        = string
  default     = "db.t3.micro"
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter"
  type        = string
  default     = "gp3"
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1' or `gp3`. See `notes` for limitations regarding this variable for `gp3`"
  type        = number
  default     = null
}

variable "port" {
  description = "The RDS port to use"
  type        = string
  default     = "3306"
}

variable "deletion_protection" {
  description = "The RDS parameter group deletion protection to use"
  type        = bool
  default     = false
}

variable "parameters" {
  description = "The RDS parameter group parameters to use"
  type        = list(any)
  default     = []
}

variable "option_group_name" {
  description = "The RDS option group name to use"
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "The RDS parameter group apply immediately to use"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "The RDS parameter group skip final snapshot to use"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "The RDS maintenance window to use"
  type        = string
  default     = "Sun:00:00-Sun:03:00"
}

variable "backup_window" {
  description = "The RDS backup window to use"
  type        = string
  default     = "03:00-06:00"
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 7
}

variable "ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  type        = string
  default     = "rds-ca-rsa2048-g1"
}

# Security group
variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_rules" {
  description = "The RDS ingress rules to use"
  type        = list(string)
  default     = []
}

variable "egress_rules" {
  description = "The RDS egress rules to use"
  type        = list(string)
  default     = []
}
