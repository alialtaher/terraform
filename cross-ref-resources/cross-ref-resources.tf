provider "aws" {
    region = "us-east-1"
}

resource "aws_eip" "elastic_IP_DEMO" {
  domain = "vpc"
}
resource "aws_security_group" "security_group_demo" {
    name = "security_group_demo"
    description = "Allow TLS inbound traffic from EIP"
    ingress {
        description = "TLS from EIP"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.elastic_IP_DEMO.public_ip}/32"]
    }
    egress {
        description = "Allow outbound traffic from EIP"        
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  
}