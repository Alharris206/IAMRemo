data "aws_iam_policy_document" "group_policies" {
  for_each = var.group_policies

  statement {
    effect    = "Allow"
    actions   = each.value
    resources = ["*"]
  }
}

resource "aws_iam_group_policy" "group_specific_policy" {
  for_each = var.group_policies
  name     = "${each.key}-policy"
  group    = aws_iam_group.group[each.key].name
  policy   = data.aws_iam_policy_document.group_policies[each.key].json
}


data "aws_iam_policy_document" "mfa_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:GetSessionToken"]
    resources = ["*"]
    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

resource "aws_iam_group_policy" "mfa_policy" {
  for_each = { for k in var.mfa_enabled_groups : k => var.iam_groups[k] if contains(keys(var.iam_groups), k) }
  name     = "${each.key}-mfa-policy"
  group    = aws_iam_group.group[each.key].name
  policy   = data.aws_iam_policy_document.mfa_policy.json
}
