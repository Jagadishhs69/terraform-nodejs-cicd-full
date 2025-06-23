
resource "aws_secretsmanager_secret" "app" {
  name = var.name
}

resource "aws_secretsmanager_secret_version" "creds" {
  secret_id     = aws_secretsmanager_secret.app.id
  secret_string = jsonencode(var.secrets)
}
