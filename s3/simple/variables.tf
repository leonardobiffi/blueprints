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
variable "name" {
  description = "The name to use"
  type        = string
}

# Optional
variable "policy" {
  description = "The policy statements to use"
  type = list(object({
    sid       = optional(string)
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = []
}

variable "force_destroy" {
  type        = bool
  description = "Whether to force destroy"
  default     = false
}

variable "lifecycle_rule" {
  description = "The lifecycle rule to use"
  type        = list(any)
  default     = []
}

variable "block_public_acls" {
  type        = bool
  description = "Whether to block public acls"
  default     = true
}

variable "block_public_policy" {
  type        = bool
  description = "Whether to block public policy"
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether to ignore public acls"
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether to restrict public buckets"
  default     = true
}

variable "cors_rule" {
  description = "The CORS rule to use"
  type        = list(any)
  default     = []
}

variable "control_object_ownership" {
  description = "Whether to manage S3 Bucket Ownership Controls on this bucket."
  type        = bool
  default     = false
}

variable "object_ownership" {
  description = "Object ownership. Valid values: BucketOwnerEnforced, BucketOwnerPreferred or ObjectWriter. 'BucketOwnerEnforced': ACLs are disabled, and the bucket owner automatically owns and has full control over every object in the bucket. 'BucketOwnerPreferred': Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the bucket-owner-full-control canned ACL. 'ObjectWriter': The uploading account will own the object if the object is uploaded with the bucket-owner-full-control canned ACL."
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "server_side_encryption_configuration" {
  description = "The server side encryption configuration to use"
  type        = any
  default     = {}
}

variable "versioning" {
  description = "The versioning to use"
  type        = map(string)
  default     = {}
}

variable "website" {
  description = "The website to use"
  type        = map(string)
  default     = {}
}
