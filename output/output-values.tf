provider "aws" {
    region = "us-east-1"
}
resource "aws_eip" "elastic_IP_DEMO2" {
  domain = "vpc"
}
output "public_DNS" {
    value=aws_eip.elastic_IP_DEMO2.public_dns
    
}
output "public_DNS_HTTPS" {
    value="https://${aws_eip.elastic_IP_DEMO2.public_dns}:8080"
    
}

output "EIP_all_outputs" {
    value=aws_eip.elastic_IP_DEMO2
}