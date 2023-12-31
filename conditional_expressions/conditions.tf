provider "aws" {
    region = var.awsregion
}
locals {
  common_tags= {
    owner = "alialtaheralhamod@gmail.com"
    product_name= "DevOps"
    Name= var.Dev_instance_type ==true ? var.dev_instance : var.prd_instance # using condition in locals to create a 3rd instance as a bastion host if the env type is production
    creationDate = formatdate("DD MMM YYYY hh:mm ZZZ",timestamp())
  }
}
variable "instance_names" {
  default = ["instance1", "instance2"]   
}
# if it is a  test instance, create one t2.micro instance
resource "aws_instance" "Dev_instance" {
    ami = var.ami
    instance_type = var.Dev_instance_type
    count = var.is_test==true ? 1 : 0 
}

# if it is a production instance, create two t2.large instances
resource "aws_instance" "prd_instance" {
    ami = var.ami
    instance_type = var.Prd_instance_type
    count = var.is_test==false ? 2 : 0
    tags = {
        Name = element(var.instance_names,count.index)
        #"prd-${var.AZ[0]}-${var.mapping["key1"]}"
        }
}
resource "aws_instance" "test_instance" {
    ami = var.ami
    instance_type = var.Prd_instance_type
    tags = local.common_tags
}