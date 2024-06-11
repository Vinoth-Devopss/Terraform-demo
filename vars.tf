#S3


# VPC

variable "vpc-cidr" {
default = "192.31.0.0/20"
description = "VPC CIDR BLOCK"
type = string
}

variable "vpc-id" {
default = "vpc-04e59399751d55828"
description = "Dev VPC ID"
type = string
}

variable "Public_Subnet_1" {
default = "192.31.0.0/24"
description = "Public_Subnet_1"
type = string
}

variable "Public_Subnet_2" {
default = "192.31.1.0/24"
description = "Public_Subnet_2"
type = string
}

variable "Private_Subnet_1" {
default = "192.31.8.0/24"
description = "Private_Subnet_1"
type = string
}

variable "Private_Subnet_2" {
default = "192.31.9.0/24"
description = "Private_Subnet_2"
type = string
}

variable "ssh-location" {
default = "0.0.0.0/0"
description = "SSH variable for bastion host"
type = string
}


# Prod EC2

variable "key_name" {
  description = " credentials keys to connect to ec2 instance"
  default = "Prod-API-Astrocure"
}

variable "instance_type" {
  description = "instance type for ec2"
  default = "t3.medium"
}

variable "security_group" {
  description = "Name of security group"
  default = "Prod-Astrovidhi-SG"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default = "prod-api.astrocure.co.in"
}

variable "ami_id" {
  description = "AMI ID for RHEL Ec2 instance"
  default = "ami-0d4e93e986be449cf"
}

#s3

variable "s3_services_astrocure_name" {
  description = "Name of s3"
  default = "services.astrocure.co.in"
}

variable "s3_dev_astrocure_web" {
  description = "s3_for_dev_astrocure_website"
  default = "dev.astrocure.co.in"
}

variable "s3_astrocure_web" {
  description = "s3_for_astrocure_website"
  default = "astrocure.co.in"
}

variable "s3_www_astrocure_web" {
  description = "s3_for_www_astrocure_website"
  default = "www.astrocure.co.in"
}

variable "s3_prod_admin_name" {
  description = "Name of s3"
  default = "prod-admin.astrocure.co.in"
  }

variable "s3_www_prod_admin_name" {
  description = "Name of s3"
  default = "www.admin.astrocure.co.in"
  }

# ALB

variable "security_group_id" {
  description = "Name of security group"
  default = "sg-01ff0c419888a85d4"
}

variable "alb_subnets" {
  description = "A list of subnet IDs to use for the resources."
  type        = list(string)
}

variable "vpc_id" {
  description = "Name of security group"
  default = "vpc-0370d4779722a734c"
}

# ASG

variable "asg_security_group_id" {
  description = "Name of security group"
  default = "sg-01ff0c419888a85d4"
}

variable "asg_ami_id" {
  description = "AMI ID for RHEL Ec2 instance"
  default = "ami-0d4e93e986be449cf"
}




# SNS

variable "sns_name" {
        description = "Name of the SNS Topic to be created"
        default = "prod-server-urgent-aleart"
}

variable "account_id" {
        description = "My Accout Number"
        default = "623683966429"
}

variable "security_group_ids" {
  description = "Security group id of the ec2 instance"
  type    = list(string)
  default = null
}

