provider "aws" {
    region = "us-east-1"
}
resource "aws_iam_user" "org_users" {
  count = 3
  name = "user.${count.index}"
  path = "/system"
}

output "arns" {
    value = aws_iam_user.org_users[*].arn
}