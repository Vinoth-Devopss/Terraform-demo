output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet-gateway.id
}

output "public-subnet-1_id" {
  value = aws_subnet.public-subnet-1.id
}

output "public-subnet-2_id" {
  value = aws_subnet.public-subnet-2.id
}

output "public-subnet-3_id" {
  value = aws_subnet.public-subnet-3.id
}

output "public-route-table-1_id" {
  value = aws_route_table.public-route-table-1.id
}

output "public-subnet-1-route-table-association_id" {
  value = aws_route_table_association.public-subnet-1-route-table-association.id
}


output "private-subnet-1_id" {
  value = aws_subnet.private-subnet-1.id
}

output "private-subnet-2_id" {
  value = aws_subnet.private-subnet-2.id
}

output "private-subnet-3_id" {
  value = aws_subnet.private-subnet-3.id
}

output "private-route-table-1_id" {
  value = aws_route_table.public-route-table-1.id
}

output "private-subnet-1-route-table-association_id" {
  value = aws_route_table_association.private-subnet-1-route-table-association.id
}
