
output "cluster_id" {
  description = "The id of the polardb cluster."
  value       = local.this_db_cluster_id
}

output "cluster_connection_string" {
  description = "The PolarDB cluster connection string."
  value       = concat(alicloud_polardb_cluster.cluster.*.connection_string, [""])[0]
}

output "endpoint_id" {
  description = "The id of the polardb endpoint."
  value       = concat(alicloud_polardb_endpoint.endpoint.*.id, [""])[0]
}

output "endpoint_ssl_expire_time" {
  description = "The time when the SSL certificate expires."
  value       = concat(alicloud_polardb_endpoint.endpoint.*.ssl_expire_time, [""])[0]
}

output "endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = concat(alicloud_polardb_endpoint.endpoint.*.ssl_connection_string, [""])[0]
}

output "endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.id, [""])[0]
}

output "endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.port, [""])[0]
}

output "endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.connection_string, [""])[0]
}

output "endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.ip_address, [""])[0]
}

output "account_id" {
  description = "The current account resource ID."
  value       = concat(alicloud_polardb_account.account.*.id, [""])[0]
}

output "backup_policy_retention_period" {
  description = "Cluster backup retention days, Fixed for 7 days, not modified."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.backup_retention_period, [""])[0]
}

output "data_level1_backup_retention_period" {
  description = "Cluster backup retention days for level-1 backups, Fixed for 7 days, not modified."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_retention_period, [""])[0]
}

output "data_level2_backup_retention_period" {
  description = "Cluster backup retention days for level-2 backups, Fixed for 7 days, not modified."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level2_backup_retention_period, [""])[0]
}

output "preferred_backup_period" {
  description = "Cluster backup period."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.preferred_backup_period, [""])[0]
}

output "data_level1_backup_period" {
  description = "Cluster backup period for level-1 backups."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_period, [""])[0]
}

output "data_level2_backup_period" {
  description = "Cluster backup period for level-2 backups."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level2_backup_period, [""])[0]
}

output "backup_policy_log_backup_retention_period" {
  description = "The retention period of the log backups. Valid values are `3 to 7300`, `-1`."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.log_backup_retention_period, [""])[0]
}