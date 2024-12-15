
locals {
  secret_type = var.secret_type

  secret_map = {
    username = var.secret_key,
    password = var.secret_value
  }

  secret_string = local.secret_type == "key_value_pair" ? jsonencode(local.secret_map) : var.plain_text_secret
}
resource "aws_secretsmanager_secret" "secret" {
    name = "${var.secret_name}"
    description = var.description_secretmanageer
        tags = {
        managed_by = "terraform"
    }

}

resource "aws_secretsmanager_secret_version" "secret" {  
secret_id = aws_secretsmanager_secret.secret.id
  secret_string = local.secret_string
}
