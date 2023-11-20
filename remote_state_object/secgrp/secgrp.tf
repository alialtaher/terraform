provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "secgrp1" {
    name = "testsg"
    description = "allow tls"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${data.terraform_remote_state.EIP.outputs.public_ip}/32"]
    }
    egress {
        from_port = 0
        to_port = 62234
        protocol = "tcp"
        cidr_blocks = ["${data.terraform_remote_state.EIP.outputs.public_ip}/32"]
    }
  
}