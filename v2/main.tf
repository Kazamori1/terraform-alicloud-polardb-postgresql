
locals {
  create_default_endpoint = var.create_endpoint && length(var.endpoints) == 0
  default_endpoint = local.create_default_endpoint ? {
    endpoint_default ={
      auto_add_new_nodes = var.auto_add_new_nodes
      endpoint_config = var.endpoint_config
      ssl_enabled = var.ssl_enabled
      net_type = var.net_type
      ssl_auto_rotate = var.ssl_auto_rotate
      connection_prefix = var.private_connection_prefix
      port = var.private_port
      nodes = var.nodes
      nodes_key = []
      read_write_mode = var.read_write_mode
    }
  } : {}

  create_default_endpoint_address = var.create_endpoint_address && length(var.endpoint_addresses) == 0
  default_endpoint_address = local.create_default_endpoint_address ? {
    endpoint_address_default ={
      db_endpoint = "endpoint_default"
      connection_prefix = var.connection_prefix
      port = var.port
    }
  } : {}
}

moved {
  from = alicloud_polardb_endpoint.endpoint[0]
  to   = alicloud_polardb_endpoint.endpoint["endpoint_default"]
}

moved {
  from = alicloud_polardb_endpoint_address.endpoint_address[0]
  to   = alicloud_polardb_endpoint_address.endpoint_address["endpoint_address_default"]
}

resource "alicloud_polardb_cluster" "cluster" {
  count              = var.create_cluster ? 1 : 0
  db_type            = "PostgreSQL"
  vswitch_id         = var.vswitch_id
  zone_id            = var.zone_id
  db_version         = var.db_version
  pay_type           = var.pay_type
  db_node_class      = var.db_node_class
  description        = var.polardb_cluster_description
  modify_type        = var.modify_type
  db_node_count      = length(var.db_cluster_nodes_configs) >0 ? null : var.db_node_count
  renewal_status     = var.renewal_status
  auto_renew_period  = var.auto_renew_period
  period             = var.period
  security_ips       = var.security_ips
  resource_group_id  = var.resource_group_id
  maintain_time      = var.maintain_time
  collector_status   = var.collector_status
  tde_status         = var.tde_status
  security_group_ids = var.security_group_ids
  deletion_lock      = var.deletion_lock
  dynamic "parameters" {
    for_each = var.parameters
    content {
      name  = lookup(parameters.value, "name", null)
      value = lookup(parameters.value, "value", null)
    }
  }
  tags = var.tags
  db_cluster_nodes_configs = {
    for node, config in var.db_cluster_nodes_configs : node => jsonencode({for k, v in config : k => v if v != null})
  }
}

resource "alicloud_polardb_endpoint" "endpoint" {
  db_cluster_id           = local.this_db_cluster_id
  endpoint_type           = var.endpoint_type
  db_cluster_nodes_ids    = alicloud_polardb_cluster.cluster[0].db_cluster_nodes_ids
  for_each                = length(var.endpoints) > 0 ? var.endpoints : local.default_endpoint
  auto_add_new_nodes      = each.value.auto_add_new_nodes
  endpoint_config         = each.value.endpoint_config
  ssl_enabled             = each.value.ssl_enabled
  net_type                = each.value.net_type
  ssl_auto_rotate         = each.value.ssl_auto_rotate
  connection_prefix       = each.value.connection_prefix
  port                    = each.value.port
  nodes                   = each.value.nodes
  nodes_key               = each.value.nodes_key
  read_write_mode         = each.value.read_write_mode
}

resource "alicloud_polardb_endpoint_address" "endpoint_address" {
  db_cluster_id     = local.this_db_cluster_id
  net_type          = "Public"
  for_each          = length(var.endpoint_addresses) > 0 ? var.endpoint_addresses : local.default_endpoint_address
  db_endpoint_id    = alicloud_polardb_endpoint.endpoint[each.value.db_endpoint].db_endpoint_id
  connection_prefix = each.value.connection_prefix
  port              = each.value.port
}

resource "alicloud_polardb_cluster_endpoint" "endpoint" {
  count             = lookup(var.cluster_endpoint, "endpoint", null) != null ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  connection_prefix = lookup(var.cluster_endpoint["endpoint"], "connection_prefix", null)
  port              = lookup(var.cluster_endpoint["endpoint"], "port", null)
}

resource "alicloud_polardb_endpoint_address" "cluster_endpoint_address" {
  count             = lookup(var.cluster_endpoint, "public_address", null) != null ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  db_endpoint_id    = concat(alicloud_polardb_cluster_endpoint.endpoint.*.db_endpoint_id, [""])[0]
  net_type          = "Public"
  connection_prefix = lookup(var.cluster_endpoint["public_address"], "connection_prefix", null)
  port              = lookup(var.cluster_endpoint["public_address"], "port", null)
}

resource "alicloud_polardb_primary_endpoint" "endpoint" {
  count             = lookup(var.primary_endpoint, "endpoint", null) != null ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  connection_prefix = lookup(var.primary_endpoint["endpoint"], "connection_prefix", null)
  port              = lookup(var.primary_endpoint["endpoint"], "port", null)
}

resource "alicloud_polardb_endpoint_address" "priamry_endpoint_address" {
  count             = lookup(var.primary_endpoint, "public_address", null) != null ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  db_endpoint_id    = concat(alicloud_polardb_primary_endpoint.endpoint.*.db_endpoint_id, [""])[0]
  net_type          = "Public"
  connection_prefix = lookup(var.primary_endpoint["public_address"], "connection_prefix", null)
  port              = lookup(var.primary_endpoint["public_address"], "port", null)
}

resource "alicloud_polardb_account" "account" {
  count                  = var.create_account ? 1 : 0
  db_cluster_id          = local.this_db_cluster_id
  account_name           = var.account_name
  account_password       = var.account_password
  account_description    = var.account_description
  kms_encrypted_password = var.kms_encrypted_password
  kms_encryption_context = var.kms_encryption_context
  account_type           = var.account_type
}

resource "alicloud_polardb_backup_policy" "backup_policy" {
  count                               = var.create_backup_policy ? 1 : 0
  db_cluster_id                       = local.this_db_cluster_id
  preferred_backup_period             = var.preferred_backup_period
  preferred_backup_time               = var.preferred_backup_time
  data_level1_backup_retention_period = var.data_level1_backup_retention_period
  data_level2_backup_retention_period = var.data_level2_backup_retention_period
  data_level2_backup_period           = var.data_level2_backup_period
  log_backup_retention_period         = var.log_backup_retention_period
}