#default variables
variable "vpn_IP" {
    type = string
    default = "127.0.0.1"
}
variable "instancetype" {
    type = string
    default = "t2-micro"
} 
variable "goldenami" {
    type = string
    default = "ami-123456"
} 
variable "elb_name" {
    type = string
    default = "demo-elb"
}
variable "AZ" {
    type = list()
    default = ["us-east-1"]
}
variable "timeout" {
    type = number
    default = 10
}
variable "mapping"{
    type = map(string)
}

#default value can be override by env vars, e.g: terraform plan -var "instance_type=t2.small"
# if no default value is set, The cli will ask for a value of variable

#alternatively, you can specify the variables in .tfvars file 

# The variable reference priority is to check if terraform.tfvars is available, Then to check in the tf files, If nothing found then it will be based on STDIN
# you can specify a custom var file using -var-file option 
# you can use export TF_VAR_NAMEOFVAR="", it will be inherited automatically in the next execution plan  