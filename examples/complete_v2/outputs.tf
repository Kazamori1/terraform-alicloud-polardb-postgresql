
output "cluster_id" {
  description = "The id of the polardb cluster."
  value       = module.default.cluster_id
}

output "cluster_connection_string" {
  description = "The PolarDB cluster connection string."
  value       = module.default.cluster_connection_string
}

output "endpoint_id" {
  description = "The id of the polardb endpoint."
  value       = module.default.endpoint_id
}

output "endpoint_ssl_expire_time" {
  description = "The time when the SSL certificate expires."
  value       = module.default.endpoint_ssl_expire_time
}

output "endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = module.default.endpoint_ssl_connection_string
}

output "endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = module.default.endpoint_address_id
}

output "endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = module.default.endpoint_address_port
}

output "endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = module.default.endpoint_address_connection_string
}

output "endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = module.default.endpoint_address_ip_address
}

output "account_id" {
  description = "The current account resource ID."
  value       = module.default.account_id
}

output "backup_policy_retention_period" {
  description = "Cluster backup retention days, Fixed for 7 days, not modified."
  value       = module.default.backup_policy_retention_period
}

output "data_level1_backup_retention_period" {
  description = "Cluster backup retention days for level-1 backups, Fixed for 7 days, not modified."
  value       = module.default.data_level1_backup_retention_period
}

output "data_level2_backup_retention_period" {
  description = "Cluster backup retention days for level-2 backups, Fixed for 7 days, not modified."
  value       = module.default.data_level2_backup_retention_period
}

output "preferred_backup_period" {
  description = "Cluster backup period."
  value       = module.default.preferred_backup_period
}

output "data_level1_backup_period" {
  description = "Cluster backup period for level-1 backups."
  value       = module.default.data_level1_backup_period
}

output "data_level2_backup_period" {
  description = "Cluster backup period for level-2 backups."
  value       = module.default.data_level2_backup_period
}