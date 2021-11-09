resource "aws_db_subnet_group" "rdsubnet" {
  name       = "rdsubnet"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My RDS DB subnet group"
  }
}