# Add EC2 aws_security_group.
resource "aws_security_group" "Prod-Astrovidhi" {
  name        = "Prod-Astrovidhi-SG"
  description = "Enable Prod-Astrovidhi-required ports"
  vpc_id = var.vpc_id

  ingress {
  description      = "ssh"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  description      = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
   description      = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  description      = "Postgresql"
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags   = {
Name = "Prod-Astrovidhi-SG"
}
}

/*
# Add Security Rule EC2 instance to connect RDS

resource "aws_security_group_rule" "prod_ec2_to_db" {
  type        = "ingress"
  from_port   = 5432  # postgreSQL port
  to_port     = 5432
  protocol    = "tcp"
  security_group_id = "sg-0407646bc55ddf81f"  # Prod RDS security group
  source_security_group_id = "sg-0484497814e1105b4" # Prod EC2 security group
}


# Add Security Rule RDS to EC2 instance 

resource "aws_security_group_rule" "prod_db_to_ec2" {
  type        = "egress"
  from_port   = 5432  # postgreSQL port
  to_port     = 5432
  protocol    = "tcp"
  security_group_id = "sg-0407646bc55ddf81f"  # Prod RDS security group
  source_security_group_id = "sg-0484497814e1105b4" # ProdEC2 security group  
}
*/

