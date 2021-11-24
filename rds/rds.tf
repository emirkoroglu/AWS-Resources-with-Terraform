resource "aws_db_instance" "rds" {
  engine                     = "mysql"
  engine_version             = "5.7"
  instance_class             = "db.t3.micro"
  name                       = "mydb"
  username                   = "foo"
  password                   = "foobarbaz"
  parameter_group_name       = "default.mysql5.7"
  skip_final_snapshot        = true
  auto_minor_version_upgrade = true
  security_group_id          = "rds1"
  db_subnet_group_name       = "rdsubnet"
  vpc_security_group_ids     = ["rds"]
}