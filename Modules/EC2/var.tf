# EC2

variable "ami_id" {
  default = "ami-0d4e93e986be449cf"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "prod-api_key_name" {
  default = "Prod-API-Astrocure"
}

variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "public-subnet-1_id" {
  type = string
}

variable "public-subnet-2_id" {
  type = string
}


