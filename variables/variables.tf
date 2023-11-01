#default variables

variable "vpn_IP" { ###to be used in varsdemo, sec1, sec2, and sec3 
    default = "116.50.30.20/32"
} 

variable "instancetype" { ###to be used in varsdemo, instance1 
    default = "t2.micro"
} 
variable "goldenami" { ###to be used in varsdemo, instance1 
    default = "ami-124356722"
} 

#default value can be override by env vars, e.g: terraform plan -var "instance_type=t2.small"
# if no default value is set, The cli will ask for a value of variable

#alternatively, you can specify the variables in .tfvars file 

# The variable reference priority is to check if terraform.tfvars is available, Then to check in the tf files, If nothing found then it will be based on STDIN
# you can specify a custom var file using -var-file option 
# you can use export TF_VAR_NAMEOFVAR="", it will be inherited automatically in the next execution plan  