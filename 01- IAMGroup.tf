resource "aws_iam_group" "group" {
  for_each = var.iam_groups
  name     = each.key
}

