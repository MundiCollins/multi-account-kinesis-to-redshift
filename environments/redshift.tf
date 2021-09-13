resource "aws_redshift_cluster" "events_cluster" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  cluster_identifier  = "events-cluster"
  database_name       = "events"
  master_username     = "testuser"
  master_password     = "Mustbe8characters"
  node_type           = "dc1.large"
  cluster_type        = "single-node"
  skip_final_snapshot = true
}
