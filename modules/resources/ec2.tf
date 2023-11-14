module "ec2_1" {
 source = "../modules/ec2"  
# instance_type = "t2.large"
}


resource "aws_instance" "testinstance" {
    ami= module.ec2_1.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = module.ec2_1.secgrp.id   
}


