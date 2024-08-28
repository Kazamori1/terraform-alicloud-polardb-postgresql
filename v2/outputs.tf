
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
  value       = {for endpoint_key, endpoint in alicloud_polardb_endpoint.endpoint : endpoint_key => endpoint.id}
}

output "endpoint_ssl_expire_time" {
  description = "The time when the SSL certificate expires."
  value       = {for endpoint_key, endpoint in alicloud_polardb_endpoint.endpoint : endpoint_key => endpoint.ssl_expire_time}
}

output "endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = {for endpoint_key, endpoint in alicloud_polardb_endpoint.endpoint : endpoint_key => endpoint.ssl_connection_string}
}

output "endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = {for endpoint_address_key, endpoint_address in alicloud_polardb_endpoint_address.endpoint_address : endpoint_address_key => endpoint_address.id}
}

output "endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = {for endpoint_address_key, endpoint_address in alicloud_polardb_endpoint_address.endpoint_address : endpoint_address_key => endpoint_address.port}
}

output "endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = {for endpoint_address_key, endpoint_address in alicloud_polardb_endpoint_address.endpoint_address : endpoint_address_key => endpoint_address.connection_string}
}

output "endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = {for endpoint_address_key, endpoint_address in alicloud_polardb_endpoint_address.endpoint_address : endpoint_address_key => endpoint_address.ip_address}
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