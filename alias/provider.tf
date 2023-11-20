provider "aws" {
    region = "us-east-1"
    alias = "active"
    profile = "default" 
}
provider "aws" {
    region = "us-west-1"
    alias = "standby"
    profile = "default"
}
