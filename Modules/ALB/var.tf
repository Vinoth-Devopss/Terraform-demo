

variable "security_group_id" {
  description = "Name of security group."
  default = "sg-01ff0c419888a85d4"
}

variable "alb_subnets" {
  description = "A list of subnet IDs to use for the resources."
  default = ["subnet-0de70fb106c2c9385", "subnet-087e247aef8da2b51", "subnet-010aa14f3deca64af"]
}

variable "vpc_id" {
  description = "Name of security group"
  default = "vpc-0370d4779722a734c"
}



