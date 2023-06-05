resource "random_password" "rdspassword" {
  length = 16
  special = true
  override_special = "_%@"
}
resource "aws_db_instance" "wizsartest" {
  allocated_storage    = 10
  db_name              = "wizsartestrds"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "wizsartest"
  password             = random_password.rdspassword.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
}

resource "aws_db_snapshot" "wizsartest" {
  db_instance_identifier = aws_db_instance.wizsartest.identifier
  db_snapshot_identifier = "wizsartestsnapshot"
  shared_accounts = ["all"]
}