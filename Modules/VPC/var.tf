# VPC 

variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "public-subnet-1_id" {
  type = string
}

variable "public-subnet-2_id" {
  type = string
}

variable "public-subnet-3_id" {
  type = string
}

variable "public-route-table-1_id" {
  type = string
}

variable "public-subnet-1-route-table-association_id" {
  type = string
}


variable "private-subnet-1_id" {
  type = string
}

variable "private-subnet-2_id" {
  type = string
}

variable "private-subnet-3_id" {
  type = string
}

variable "private-route-table-1_id" {
  type = string
}

variable "private-subnet-1-route-table-association_id" {
  type = string
}
