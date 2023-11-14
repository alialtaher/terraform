provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "ec2" {
    ami = local.ami
    instance_type = local.instance_type
}

locals {
  ami = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"

}

resource "aws_security_group" "instancesecgrp" {
  name        = "allow_tls"
  description = "security group"
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = "127.0.0.1/0"
  }  
}

output "aws_instance_id" {
  value = aws_instance.ec2.id
}

output "secgrp" {
  value = aws_security_group.instancesecgrp
}
output "ami" {
  value = local.ami
}