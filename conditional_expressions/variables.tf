variable "awsregion" {
  type = string
  default = "us-east-1"
}
variable "is_test" {
  type = bool
  default = true
}
variable "ami" {
    type= string
    default = "ami-blp"
}
variable "Dev_instance_type" { 
    type = string
    default = "t2.micro"
}
variable "Prd_instance_type" { 
    type = string
    default = "t2.large"
}
