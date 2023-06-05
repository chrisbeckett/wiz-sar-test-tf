resource "random_password" "redshiftpassword" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "aws_redshift_cluster" "wizsar-redshift" {
  cluster_identifier = "wiz-sar-test-redshift-cluster"
  database_name      = "wizsartestdb"
  master_username    = "wizsartestuser"
  master_password    = random_password.redshiftpassword.result
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  publicly_accessible = true
  skip_final_snapshot = true
}