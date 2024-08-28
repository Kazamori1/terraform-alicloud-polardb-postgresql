locals {
  # Get ID of db cluster resources
  this_db_cluster_id = var.create_cluster ? concat(alicloud_polardb_cluster.cluster.*.id, [""])[0] : var.db_cluster_id
}