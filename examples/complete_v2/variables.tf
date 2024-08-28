#alicloud_polardb_cluster
variable "db_node_class" {
  description = "The db_node_class of cluster node."
  type        = string
  default     = "polar.pg.x4.medium"
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = "polardb_cluster_description"
}

variable "modify_type" {
  description = "Use as db_node_class change class, define upgrade or downgrade. Valid values are Upgrade, Downgrade, Default to Upgrade."
  type        = string
  default     = "Upgrade"
}

variable "db_node_count" {
  description = "Number of the PolarDB cluster nodes, default is 2(Each cluster must contain at least a primary node and a read-only node). Add/remove nodes by modifying this parameter, valid values: [2~16]."
  type        = number
  default     = 2
}

variable "renewal_status" {
  description = "Valid values are AutoRenewal, Normal, NotRenewal, Default to NotRenewal."
  type        = string
  default     = "NotRenewal"
}

variable "auto_renew_period" {
  description = "Auto-renewal period of an cluster, in the unit of the month. It is valid when pay_type is PrePaid. Valid value:1, 2, 3, 6, 12, 24, 36, Default to 1."
  type        = number
  default     = 1
}

variable "period" {
  description = "The duration that you will buy DB cluster (in month). It is valid when pay_type is PrePaid. Valid values: [1~9], 12, 24, 36."
  type        = number
  default     = 1
}

variable "security_ips" {
  description = "List of IP addresses allowed to access all databases of an cluster."
  type        = set(string)
  default     = null
}

variable "maintain_time" {
  description = "Maintainable time period format of the instance: HH:MMZ-HH:MMZ (UTC time)"
  type        = string
  default     = "16:00Z-17:00Z"
}

variable "collector_status" {
  description = "Specifies whether to enable or disable SQL data collector. Valid values are Enable, Disabled."
  type        = string
  default     = "Disabled"
}

variable "security_group_ids" {
  description = "The ID of the security group."
  type        = set(string)
  default     = null
}

variable "deletion_lock" {
  description = "Valid values are 0, 1. 1 means to open the cluster protection lock, 0 means to close the cluster protection lock. Cannot modify after created when pay_type is Prepaid. "
  type        = number
  default     = null
}

variable "parameters" {
  description = "Set of parameters needs to be set after DB cluster was launched. "
  type        = list(map(string))
  default     = []
}

#alicloud_polardb_endpoint
variable "endpoint_type" {
  description = "Type of the endpoint. Custom, Cluster, Primary are valid, default to Custom. However when creating a new endpoint, it also only can be Custom."
  type        = string
  default     = "Custom"
}
variable "read_write_mode" {
  description = "Read or write mode. Valid values are ReadWrite, ReadOnly. When creating a new custom endpoint, default to ReadOnly."
  type        = string
  default     = "ReadOnly"
}
variable "nodes" {
  description = "Node id list for endpoint configuration. Default is all nodes."
  type        = set(string)
  default     = null
}
variable "auto_add_new_nodes" {
  description = "Whether the new node automatically joins the default cluster address. Valid values are Enable, Disable. When creating a new custom endpoint, default to Disable."
  type        = string
  default     = "Enable"
}
variable "endpoint_config" {
  description = "The advanced settings of the endpoint of Apsara PolarDB clusters are in JSON format."
  type        = map(any)
  default     = {}
}

variable "ssl_enabled" {
  description = "Specifies how to modify the SSL encryption status. Valid values: Disable, Enable, Update."
  type        = string
  default     = "Disable"
}

variable "net_type" {
  description = "The network type of the endpoint address.Valid values: Public, Private, Inner."
  type        = string
  default     = "Private"
}

variable "private_connection_prefix" {
  description = "The private connection address prefix of the specified custom endpoint."
  type        = string
  default     = null
}

variable "private_port" {
  description = "The private connection port of the specified custom endpoint. Valid between 1000 and 5999."
  type        = string
  default     = "5432"
}

#alicloud_polardb_endpoint_address
variable "connection_prefix" {
  description = "The public connection address prefix of the specified custom endpoint."
  type        = string
  default     = "testpgconnprefix-public"
}

variable "port" {
  description = "The public connection port of the specified custom endpoint. Valid between 1000 and 5999."
  type        = string
  default     = "5432"
}

#alicloud_polardb_account
variable "account_password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  type        = string
  default     = "tf_test123"
}

variable "account_description" {
  description = "The specification of account description."
  type        = string
  default     = "tf_account_description"
}

variable "kms_encrypted_password" {
  description = "An KMS encrypts password used to a db account. If the account_password is filled in, this field will be ignored."
  type        = string
  default     = ""
}

variable "kms_encryption_context" {
  description = "An KMS encryption context,It is valid when kms_encrypted_password is set."
  type        = map(any)
  default     = {}
}

#alicloud_polardb_backup_policy
variable "preferred_backup_period" {
  description = "PolarDB Cluster backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. Default to ['Tuesday','Thursday', 'Saturday']."
  type        = set(string)
  default     = ["Tuesday", "Thursday", "Saturday"]
}

variable "preferred_backup_time" {
  description = "PolarDB Cluster backup time, in the format of HH:mmZ- HH:mmZ. Time setting interval is one hour. Default to '02:00Z-03:00Z'. China time is 8 hours behind it."
  type        = string
  default     = "02:00Z-03:00Z"
}

variable "data_level2_backup_period" {
  description = "PolarDB Cluster backup period of level-2 backups. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. Default to ['Tuesday','Thursday', 'Saturday']."
  type        = set(string)
  default     = ["Tuesday", "Thursday", "Saturday"]
}

variable "data_level1_backup_retention_period" {
  description = "PolarDB Cluster retention period of level-1 backups. Valid values: 3 to 14. Unit: days."
  type        = number
  default     = 7
}

variable "data_level2_backup_retention_period" {
  description = "PolarDB Cluster retention period of level-2 backups. Valid values: 0, 30 to 7300, -1. Default to 0."
  type        = number
  default     = 0
}

variable "log_backup_retention_period" {
  description = "The retention period of the log backups. Valid values are `3 to 7300`, `-1`."
  type        = string
  default     = "8"
}

#alicloud_polardb_cluster_endpoint
variable "cluster_endpoint" {
  description = "Map of cluster endpoints and their attributes. The cluster endpoint is created by default with PolarDB cluster."
  type        = any
  default     = {}
}

#alicloud_polardb_primary_endpoint
variable "primary_endpoint" {
  description = "Map of primary endpoints and their attributes. The primary endpoint is created by default with PolarDB cluster."
  type        = any
  default     = {}
}

variable "db_cluster_nodes_configs" {
  description = "The advanced settings for all nodes in the cluster except for the RW node, including db_node_class properties."
  type        = map(object({
    db_node_class           = string
    db_node_role            = optional(string,null)
  }))
  default     = {}
}

variable "endpoints" {
  description = "Configure the endpoints based on the node keys provided by the db_cluster_nodes_configs."
  type = map(object({
    nodes_key               = optional(set(string),null)
    nodes                   = optional(set(string),null)
    read_write_mode         = optional(string,"ReadOnly")
    auto_add_new_nodes      = optional(string,"Disable")
    endpoint_config         = optional(map(any),{})
    ssl_enabled             = optional(string,"Disable")
    net_type                = optional(string,"Private")
    ssl_auto_rotate         = optional(string,null)
    connection_prefix       = optional(string,null)
    port                    = optional(string,"")
  }))
  default = {}
}

variable "endpoint_addresses" {
  description = "Configure the endpoint addresss based on the keys provided by the endpoints."
  type = map(object({
    db_endpoint       = string
    connection_prefix = optional(string,null)
    port              = optional(string,"")
  }))
  default = {}
}
