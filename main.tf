/*

# Create Prod Astrovidhi Backend-S3.
module "Backend-S3" {
  source = "./Modules/Backend-S3"
}

# Create Prod Astrovidhi DYNAMODB..
module "DYNAMODB" {
  source = "./Modules/DYNAMODB"
}

*/

/*

# Create DEV Astrovidhi domain ACM services..
module "ACMS" {
  source = "./Modules/ACMS"
  }

*/

# Create Prod Astrovidhi S3 services.

module "S3" {
  source = "./Modules/S3"

  s3_prod_admin_name = var.s3_prod_admin_name
  s3_www_prod_admin_name = var.s3_www_prod_admin_name
  s3_dev_astrocure_web = var.s3_dev_astrocure_web 
  s3_astrocure_web = var.s3_astrocure_web 
  s3_www_astrocure_web = var.s3_www_astrocure_web 
  s3_services_astrocure_name = var.s3_services_astrocure_name 
  
}


# Create Prod Astrovidhi  VPC..
module "VPC" {
  source = "./Modules/VPC"
  vpc_id = module.VPC.vpc_id
  internet_gateway_id = module.VPC.vpc_id
  public-subnet-1_id  = module.VPC.vpc_id
  public-subnet-2_id  = module.VPC.vpc_id
  public-subnet-3_id  = module.VPC.vpc_id
  public-route-table-1_id = module.VPC.vpc_id
  public-subnet-1-route-table-association_id = module.VPC.vpc_id
  private-subnet-1_id  = module.VPC.vpc_id
  private-subnet-2_id  = module.VPC.vpc_id
  private-subnet-3_id  = module.VPC.vpc_id
  private-route-table-1_id = module.VPC.vpc_id
  private-subnet-1-route-table-association_id = module.VPC.vpc_id
  }

# Create Prod Astrovidhi SECURITY-GROUP..
module "SECURITY-GROUP" {
  source = "./Modules/SECURITY-GROUP"
  vpc_id = module.VPC.vpc_id
  }


# Create DEV Astrovidhi domain Hosted zones and DNS records on Route-53 services.
module "Route-53" {
  source = "./Modules/R53"
  }


# Create Prod Astrovidhi EC2.
module "EC2" {
  source = "./Modules/EC2"

  vpc_id = module.VPC.vpc_id
  security_group_id = module.SECURITY-GROUP.security_group_id
  public-subnet-1_id = module.VPC.public-subnet-1_id
  public-subnet-2_id = module.VPC.public-subnet-2_id
  }


# Create Prod Astrovidhi ALB.
module "ALB" {
  source = "./Modules/ALB"

  vpc_id = var.vpc_id
  security_group_id = var.security_group_id
  alb_subnets = var.alb_subnets
    }

# Create Prod Astrovidhi ASG..
module "ASG" {
  source = "./Modules/ASG"
  #security_group_id = var.asg_security_group_id
    }


# Create Prod Astrovidhi domain ACM for HYB services..
module "ACM-HYD" {
  source = "./Modules/ACM-HYD"
  }

# Create Prod Astrovidhi domain MONITORING & SNS services..
module "MONITORING" {
  source = "./Modules/MONITORING"
  }

