variable  "name" {
    type = "string"
}

variable "project" {
    type = "string"
    default = ""
}

variable "storage_class" {
    default = "MULTI_REGIONAL"
}

variable "lifecycleenabled" {
    default = "false"
}

variable "force_destroy" {
    description = "When deleting a bucket, this boolean option will delete all contained objects."
    default = "true"
}

variable "action_type" {
    description = "Default action type is delete after 5 days"
    default = "Delete"
}

variable "age" {
    description = "Minimum age of an object in days to satisfy this condition."
    default     = "5"
}

variable "versioning_enabled" {
    description = "While set to true, versioning is fully enabled for this bucket."
    default     = "false"
}

# bucket ACL
variable "default_acl" {
  description = "Configure this ACL to be the default ACL."
  default     = "projectPrivate"
}

variable "role_entity" {
  description = "List of role/entity pairs in the form ROLE:entity."
  type        = "list"
  default     = []
}