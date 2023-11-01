variable "region" {
  type = string
  default = "us-east-1"
}

variable "job_roles" {
    type = list(string)
    default = [ "SystemAdmin", "SoftwareDeveloper", "NetworkAdmin", "DatabaseAdmin" ]
}