provider "aws" {
    region = var.region
}

resource "aws_iam_user" "SysOps_members" {
    name = var.job_roles[count.index]
    count = 5
    path = "/system"
}
