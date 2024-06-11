# Create VPC
# terraform aws create vpc.

resource "aws_vpc" "vpc" {
  cidr_block = "192.31.0.0/20"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Prod-Astrovidhi-VPC"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
vpc_id    = aws_vpc.vpc.id
tags = {
Name    = "Prod-Astrovidhi-internet_gateway"
}
}

# Create Public Subnet 1
# terraform aws create public subnet 1
resource "aws_subnet" "public-subnet-1" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = "192.31.0.0/24"
availability_zone       = "ap-south-2a"
map_public_ip_on_launch = true
tags      = {
Name    = "Prod-Astrovidhi-public-subnet-1"
}
}

# Create Public Subnet 2
# terraform aws create public subnet 2
resource "aws_subnet" "public-subnet-2" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = "192.31.1.0/24"
availability_zone       = "ap-south-2b"
map_public_ip_on_launch = true
tags      = {
Name    = "Prod-Astrovidhi-public-subnet-2"
}
}

# Create Public Subnet 3
# terraform aws create public subnet 3
resource "aws_subnet" "public-subnet-3" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = "192.31.2.0/24"
availability_zone       = "ap-south-2c"
map_public_ip_on_launch = true
tags      = {
Name    = "Prod-Astrovidhi-public-subnet-3"
}
}

# Create Route Table and Add Public Route 1
# terraform aws create route table
resource "aws_route_table" "public-route-table-1" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.internet-gateway.id
}
tags       = {
Name     = "Prod-Astrovidhi-Public-Route-Table-1"
}
}

# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table 1
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
subnet_id         = aws_subnet.public-subnet-1.id      
route_table_id      = aws_route_table.public-route-table-1.id
}

# Associate Public Subnet 2 to "Public Route Table"
# terraform aws associate subnet with route table 1
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
subnet_id      = aws_subnet.public-subnet-2.id
route_table_id = aws_route_table.public-route-table-1.id
}

# Associate Public Subnet 3 to "Public Route Table"
# terraform aws associate subnet with route table 3
resource "aws_route_table_association" "public-subnet-3-route-table-association" {
subnet_id      = aws_subnet.public-subnet-3.id
route_table_id = aws_route_table.public-route-table-1.id
}


# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
vpc_id                   = aws_vpc.vpc.id
cidr_block               = "192.31.8.0/24"
availability_zone        = "ap-south-2a"
map_public_ip_on_launch  = false
tags      = {
Name    = "Prod-Astrovidhi-private-subnet-1"
}
}

# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "private-subnet-2" {
vpc_id                   = aws_vpc.vpc.id
cidr_block               = "192.31.9.0/24"
availability_zone        = "ap-south-2b"
map_public_ip_on_launch  = false
tags      = {
Name    = "Prod-Astrovidhi-private-subnet-2"
}
}

# Create Private Subnet 3
# terraform aws create subnet
resource "aws_subnet" "private-subnet-3" {
vpc_id                   = aws_vpc.vpc.id
cidr_block               = "192.31.10.0/24"
availability_zone        = "ap-south-2c"
map_public_ip_on_launch  = false
tags      = {
Name    = "Prod-Astrovidhi-private-subnet-3"
}
}



# Create Route Table and Add private Route 1
# terraform aws create route table
resource "aws_route_table" "private-route-table-1" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.internet-gateway.id
}
tags       = {
Name     = "Prod-Astrovidhi-Private-Route-Table-1"
}
}


# Associate private Subnet 1 to "private Route Table"
# terraform aws associate subnet with route table 1
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
subnet_id         = aws_subnet.private-subnet-1.id      
route_table_id      = aws_route_table.private-route-table-1.id
}

# Associate private Subnet 2 to "private Route Table"
# terraform aws associate subnet with route table 2
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
subnet_id      = aws_subnet.private-subnet-2.id
route_table_id = aws_route_table.private-route-table-1.id
}

# Associate private Subnet 3 to "private Route Table"
# terraform aws associate subnet with route table 3
resource "aws_route_table_association" "private-subnet-3-route-table-association" {
subnet_id      = aws_subnet.private-subnet-3.id
route_table_id = aws_route_table.private-route-table-1.id
}
