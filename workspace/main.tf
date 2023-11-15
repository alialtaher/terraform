provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "env_instance" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = lookup(var.instance_type,terraform.workspace) 

}
variable "instance_type" { 
    type = map(string)
    default = {
      "default" = "t2.nano"
      "dev" = "t2.micro"
      "prd" = "t2.large"
    }
  
}