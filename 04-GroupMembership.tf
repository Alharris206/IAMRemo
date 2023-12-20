resource "aws_iam_group_membership" "group_membership" {
  for_each = var.group_users

  name   = "${each.key}-membership"
  users  = each.value
  group  = aws_iam_group.group[each.key].name
}

