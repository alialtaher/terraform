provider "aws" {
    region = "us-east-1"
}
data "aws_ami" "AppAMI" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]
    }
}

resource "aws_instance" "instance1" {
    instance_type = "t2.micro"
    ami = data.aws_ami.AppAMI.id
}