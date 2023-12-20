resource "aws_secretsmanager_secret" "tests" {
  name            = "my_secret_names"
  kms_key_id      = aws_kms_key.iam_key.key_id  
}


resource "aws_secretsmanager_secret_version" "tests" {
  secret_id     = aws_secretsmanager_secret.tests.id
  secret_string = jsonencode({for k, v in aws_iam_access_key.access_key : k => {"AccessKey" = v.id, "SecretAccessKey" = v.secret}})
}

