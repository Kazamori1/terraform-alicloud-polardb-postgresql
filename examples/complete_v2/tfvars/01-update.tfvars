
db_node_class               = "polar.pg.x4.medium"
polardb_cluster_description = "update_polardb_cluster_description"
modify_type                 = "Upgrade"
db_node_count               = 2
renewal_status              = "Normal"
auto_renew_period           = 2
period                      = 2
maintain_time               = "16:00Z-17:00Z"
collector_status            = "Enable"
deletion_lock               = 0
parameters = [
  {
    name  = "autovacuum_vacuum_cost_limit"
    value = "9999"
  }
]
#alicloud_polardb_endpoint
endpoint_type             = "Custom"
read_write_mode           = "ReadWrite"
auto_add_new_nodes        = "Enable"
endpoint_config           = {}
ssl_enabled               = "Disable"
net_type                  = "Private"
private_connection_prefix = "testpgconnprefix"
private_port              = "5432"
#alicloud_polardb_endpoint_address
connection_prefix = "testpgconnprefix-public"
port              = "5432"
#alicloud_polardb_account
account_password       = "tf_test123456"
account_description    = "update_tf_account_description"
kms_encrypted_password = ""
kms_encryption_context = {}
#alicloud_polardb_backup_policy
preferred_backup_period             = ["Tuesday", "Saturday"]
preferred_backup_time               = "02:00Z-03:00Z"
data_level1_backup_retention_period = 10
data_level2_backup_retention_period = 40
data_level2_backup_period           = ["Tuesday", "Saturday"]
log_backup_retention_period         = "8"
#alicloud_polardb_cluster_endpoint
cluster_endpoint = {
  endpoint = {
    #private adress
    connection_prefix = "pgclustertestprefix"
    port              = 5432
  }
  public_address = {
    #public adress
    connection_prefix = "pgclustertestprefix-public"
    port              = 5432
  }
}
#alicloud_polardb_primary_endpoint
primary_endpoint = {
  endpoint = {
    #private adress
    connection_prefix = "pgprimarytestprefix"
    port              = 5432
  }
  public_address = {
    #public adress
    connection_prefix = "pgprimarytestprefix-public"
    port              = 5432
  }
}

db_cluster_nodes_configs = {
  node_writer = {
    db_node_class    = "polar.pg.x4.medium"
    db_node_role     = "Writer"
  }
  node_reader_1 = {
    db_node_class    = "polar.pg.x4.medium"
  }
  node_reader_2 = {
    db_node_class    = "polar.pg.x8.medium"
  }
}

endpoints = {
  endpoint_default = {
    nodes_key = ["node_writer","node_reader_1"]
    read_write_mode = "ReadWrite"
    auto_add_new_nodes = "Disable"
  }
  endpoint_1 = {
    nodes_key = ["node_reader_1","node_reader_2"]
    read_write_mode = "ReadOnly"
    auto_add_new_nodes = "Disable"
  }
}

endpoint_addresses = {
  endpoint_address_default = {
    db_endpoint         = "endpoint_default"
    connection_prefix   = "testpolardbconn1"
  }
  endpoint_address_1 = {
    db_endpoint         = "endpoint_1"
    connection_prefix   = "testpolardbconn2"
  }
}