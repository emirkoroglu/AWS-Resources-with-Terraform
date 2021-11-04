resource "aws_iam_user_group_membership" "sysusers" {
  user = aws_iam_user.user1.name

  groups = [
    aws_iam_group.group1.name,
  ]
}

resource "aws_iam_user" "user1" {
  name = "bob"
  
  tags = {
    Team = "DevOps"
 }
}

resource "aws_iam_group" "group1" {
  name = "sysusers"
}