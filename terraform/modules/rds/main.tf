
resource "aws_db_instance" "postgres" {
  identifier         = var.name
  allocated_storage  = 20
  engine             = "postgres"
  instance_class     = var.instance_class
  name               = var.db_name
  username           = var.username
  password           = var.password
  skip_final_snapshot = true
  publicly_accessible = false
  vpc_security_group_ids = [var.security_group_id]
}
