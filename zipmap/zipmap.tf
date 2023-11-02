provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "users" {
  name = "user.${count.index}"
  path = "/system/"
  count = 3 
}

output "ARNs" {
    value = aws_iam_user.users[*].arn
}
output "NAMEs" {
    value = aws_iam_user.users[*].name
}
output "combined" {
    value = zipmap(aws_iam_user.users[*].arn,aws_iam_user.users[*].name)
}