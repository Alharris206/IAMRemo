iam_groups = {
  "Revans_Rule"   = "Group for Revan's rule"
  "Maglus_Rule"   = "Group for Maglus's rule"
  "Sidious_Rule"  = "Group for Sidious's rule"
  "Banes_Rule"    = "Group for Vader's rule"
}

users = ["Vitiate", "Plagueis", "Malak", "Adraas", "Vader", "Zannah"]

group_users = {
  "Revans_Rule"   = ["Vitiate", "Malak"]
  "Maglus_Rule"   = ["Adraas"]
  "Sidious_Rule"  = ["Plagueis", "Vader"]
  "Banes_Rule"    = ["Zannah"]
}


group_policies = {
  "Revans_Rule"   = ["*"]
  "Maglus_Rule"   = ["ec2:RunInstances", "ec2:TerminateInstances", "ec2:StopInstances", "ec2:StartInstances"]
  "Sidious_Rule"  = ["ec2:ModifySnapshotAttribute", "cognito-idp:*", "cognito-sync:*"]
  "Banes_Rule"    = ["ec2:Describe*", "s3:Get*", "s3:List*"] 
}
