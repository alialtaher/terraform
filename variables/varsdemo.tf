provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "sec1" {
    ingress {
        from_port = 443
        to_port = 443
        protocol= "tcp"
    #    cidr_blocks = [var.vpn_IP]
        cidr_blocks = [var.vpn_IP]        
    }

}
resource "aws_security_group" "sec2" {
    ingress {
        from_port = 80
        to_port = 80
        protocol= "tcp"
    #    cidr_blocks = [var.vpn_IP]
        cidr_blocks = [var.vpn_IP]
    }

}
resource "aws_security_group" "sec3" {
    ingress {
        from_port = 8080
        to_port = 8080
        protocol= "tcp"
    #    cidr_blocks = [var.vpn_IP]
        cidr_blocks = [var.vpn_IP]
    }

}
resource "aws_instance" "instance1" {
  ami = var.goldenami
  #instance_type = var.instancetype
  instance_type = var.instancetype
  
}
