variable "asg_security_group_id" {
  description = "Name of security group."
  default = "sg-01ff0c419888a85d4"
}

variable "vpc_id" {
  description = "Name of security group"
  default = "vpc-0370d4779722a734c"
}

variable "asg_ami_id" {
  default = "ami-0d4e93e986be449cf"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "prod-api_key_name" {
  default = "Prod-API-Astrocure"
}





