provider "aws" {
    region = "us-east-1"
    profile = "test"
    assume_role {
      role_arn = "arn:aws:iam::994218300221:role/admin_IAM_role"
      session_name = "test"
    }
  
}