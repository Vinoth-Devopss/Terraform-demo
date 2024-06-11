/*

#-----------------------------------------------------------#
#     Astrovidhi Prod EC2  - prod-api.astrocure.co.in..
#-----------------------------------------------------------#

#Create a new Astrovidhi prod API -1 EC2 launch configuration..

resource "aws_instance" "prod-api-1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.prod-api_key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id     = var.public-subnet-1_id
  associate_public_ip_address = true
  disable_api_termination = true
  
  tags = {
Name = "prod-api-1.astrocure.co.in"
}

root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    volume_size           = "20"
    volume_type           = "gp3"
  }

connection {
    type = "ssh"
    user = "developers"
    password = var.developers_password
    private_key = file("${path.module}/prod-developers.pem")
    host = self.public_ip    
    } 

user_data = <<-EOL
  #!/bin/bash -xe
  cd /home/developers/astrovidhi-backend
  git checkout astrovidhi-prod
  git pull
  pm2 start app.js
  EOL

lifecycle {
    create_before_destroy = true
  }
}

#Create a new EIP for astrovidhi prod EC2.

resource "aws_eip" "prod-eip-1" {
  instance = aws_instance.prod-api-1.id
  vpc = true
 
tags = {
    Name = "prod-api-1.astrocure.co.in"
  }
}

#-----------------------------------------------------------#
#    Astrovidhi Prod EC2  - prod-api-2.astrocure.co.in
#-----------------------------------------------------------#

#Create a new Astrovidhi prod EC2 launch configuration..

resource "aws_instance" "prod-api-2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.prod-api_key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id     = var.public-subnet-2_id
  associate_public_ip_address = true
  disable_api_termination = true
  user_data = file("${path.module}/user_data.sh")
  
  tags = {
Name = "prod-api-2.astrocure.co.in"
}

root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    volume_size           = "20"
    volume_type           = "gp3"
  }

lifecycle {
    create_before_destroy = true
  }
}


#Create a new EIP for astrovidhi prod EC2.

resource "aws_eip" "prod-eip-2" {
  instance = aws_instance.prod-api-2.id
  vpc = true
 
tags = {
    Name = "prod-api-2.astrocure.co.in"
  }
}

*/


